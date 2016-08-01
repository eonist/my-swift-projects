import Foundation

class CGPathUtils {
    /**
     * Compiles a CGPath from a Path
     * TODO: should the cgPath be inout? test this theory
     * TODO: Create an extension for CGPath so you can do cgPath.lineTo(0,0) etc, much cleaner
     * NOTE: the CGPathAddArc method doesnt seem to support drawing from negative area to positive area. The CGPathAddRelativeArc method supports this
     */
    class func compile(cgPath:CGMutablePathRef, _ path:IPath) -> CGMutablePathRef{
        var index:Int = 0/*pathDataIndex*/
        var prevMT:CGPoint = CGPoint()/*for the closed path support*/
        var prevEnd:CGPoint = CGPoint()
        for command:Int in path.commands {
            switch(command){
            case PathCommand.moveTo:
                Swift.print("DisplayPathUtils.compile() moveTo")
                prevMT = CGPoint(path.pathData[index], path.pathData[index+1])
                prevEnd = prevMT.copy()
                CGPathMoveToPoint(cgPath, nil, prevEnd.x,prevEnd.y)
                index += 2
            case PathCommand.lineTo:
                Swift.print("DisplayPathUtils.compile() lineTo")
                prevEnd = CGPoint(path.pathData[index], path.pathData[index+1])
                CGPathAddLineToPoint(cgPath,nil,path.pathData[index],path.pathData[index+1])
                index += 2
            case PathCommand.curveTo:/*quad*/
                prevEnd = CGPoint(path.pathData[index+2], path.pathData[index+3])
                CGPathAddQuadCurveToPoint(cgPath, nil, path.pathData[index],path.pathData[index+1], path.pathData[index+2],path.pathData[index+3])
                index += 4
            case PathCommand.cubicCurveTo:
                prevEnd = CGPoint(path.pathData[index+2], path.pathData[index+3])
                //the bellow could be wrong
                Swift.print("path.pathData.count: " + "\(path.pathData.count)" + " index: " + "\(index)")
                
                //continue here: something is wrong with the path conversion, try a simpler cubic curve test with stroke. etc
                
                CGPathAddCurveToPoint(cgPath, nil, path.pathData[index],path.pathData[index+1], path.pathData[index+2],path.pathData[index+3], path.pathData[index+4], path.pathData[index+5])
                index += 6
                /**
                * NOTE: At the moment i dont think this takes largeFlag into account
                * NOTE: Arc-path-data-structure: xRadii,yRadii,rotation,largeArcFlag,sweepFlag,end.x,end.y,center.x,center.y
                */
            case PathCommand.arcTo:
                //Swift.print("prevEnd: " + "\(prevEnd)")
                Swift.print("DisplayPathUtils.compile() arcTo: x:" + "\(path.pathData[index+5])" + " y:" + "\(path.pathData[index+6])")
                //Swift.print("path.pathData[index+0]: " + "\(path.pathData[index+0])")
                let arc:IArc = PathParser.arcAt(path,0)
                DisplayArcUtils.arcTo(cgPath,arc)
                prevEnd = arc.end.copy()
                index += 9
            case PathCommand.close:/*for the closed path support*/
                if(prevEnd != prevMT) {/*<--draw a line to the prevMT if end isnt above prevMT*/
                    //Swift.print("ADD AN EXTRA CLOSE LINE")
                    CGPathAddLineToPoint(cgPath,nil,prevMT.x,prevMT.y)
                }
                CGPathCloseSubpath(cgPath)
                CGPathMoveToPoint(cgPath, nil, prevMT.x, prevMT.y)/*<--unsure if this is needed?*/
            default:
                break;
            }
        }
        return cgPath
    }
}
private class Utils{
    /**
     * Very temp, remove if the other solution works
     */
    class func arcTo(path:IPath,cgPath:CGMutablePathRef,index:Int,prevEnd:CGPoint){
        //CGPathAddArcToPoint(cgPath, nil, prevEnd.x, prevEnd.y, path.pathData[index+5], path.pathData[index+6], path.pathData[index+0])
        let center:CGPoint = CGPoint(path.pathData[index+7],path.pathData[index+8])
        let start:CGPoint = prevEnd.copy()
        let end:CGPoint = CGPoint(path.pathData[index+5],path.pathData[index+6])
        let startAngle:CGFloat = TrigParser.angle(center, start)
        
        Swift.print("DisplayPathUtils.compile() startAngle: " + "\(startAngle)")
        let endAngle:CGFloat = TrigParser.angle(center, end)
        
        Swift.print("DisplayPathUtils.compile() endAngle: " + "\(endAngle)")
        let clockwise:Bool =  path.pathData[index+4] == 1
        Swift.print("DisplayPathUtils.compile() clockwise: " + "\(clockwise)")
        let delta = TrigParser.angleSpan2(startAngle, endAngle, clockwise)//use angleSpan to find the diff between start and end angles
        Swift.print("DisplayPathUtils.compile() delta: " + "\(delta)")
        
        //CGPathAddArc(cgPath, nil, center.x,center.y, path.pathData[index+0]/*<-radius*/, startAngle,endAngle ,clockwise/**//*<-clockwise*/)
        cgPath.addRelativeArc(center, path.pathData[index+0], startAngle, delta, nil)
        //CGPathAddLineToPoint(cgPath,nil,path.pathData[index+5],path.pathData[index+6])
        
    }
}


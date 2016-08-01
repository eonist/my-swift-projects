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


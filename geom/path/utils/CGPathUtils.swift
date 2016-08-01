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

private class BasicPathParser{
    /**
     *
     */
    class func arcAt(path:IPath,_ commandIndex:Int) -> IArc{
        let pathDataIndex:Int = PathDataParser.index(path.commands, commandIndex)
        let start:CGPoint = commandIndex > 0 ? PathDataParser.end(path, commandIndex-1) : CGPoint()
        return PathDataParser.arcAt(path.pathData, pathDataIndex, start)
    }
}
private class BasicPathDataParser{
    /**
     * Returns the pathDataIndex based on the @param commandIndex
     */
    class func index(commands:Array<Int>,_ commandIndex:Int) -> Int {
        var pathDataIndex:Int = 0;
        for (var i : Int = 0; i < commandIndex; i++) {pathDataIndex += CommandParser.commandLength(commands[i])}
        return pathDataIndex;
    }
    /**
     * Returns the destination end position of a given command at @param commandIndex in @param commands
     * @param index the index of the command
     * @Note this is cpu intensive to call if you are iterating over an array
     */
    class func end(path:IPath, _ commandIndex:Int) -> CGPoint {// :TODO: rename to position?!? or maybe point?
        //START USING END2 which supports CLOSE
        let command:Int = path.commands[commandIndex];
        let pathDataIndex:Int = BasicPathDataParser.index(path.commands, commandIndex);
        return endAt(path.pathData, pathDataIndex, command);
        
        /*
        var pathData:Vector.<Number> = pathDataAt(path, commandIndex);
        if(command == PathCommand.MOVE_TO || command == PathCommand.LINE_TO || command == PathCommand.WIDE_MOVE_TO || command == PathCommand.WIDE_LINE_TO) return new Point(pathData[0],pathData[1]);
        else if(command == PathCommand.ARC_TO) return new Point(pathData[5],pathData[6]);
        else if(command == PathCommand.CURVE_TO) return new Point(pathData[2],pathData[3]);
        else {
        throw new Error("PathCommand not yet supported");
        return null;//PathCommand.CUBIC_CURVE_TO// :TODO: not supported yet
        }
        */
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


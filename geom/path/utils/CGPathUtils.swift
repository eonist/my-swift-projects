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
                //Swift.print("CGPathUtils.compile() moveTo")
                prevMT = CGPoint(path.pathData[index], path.pathData[index+1])
                prevEnd = prevMT.copy()
                CGPathMoveToPoint(cgPath, nil, prevEnd.x,prevEnd.y)
                index += 2
            case PathCommand.lineTo:
                //Swift.print("CGPathUtils.compile() lineTo")
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
                //Swift.print("path.pathData.count: " + "\(path.pathData.count)" + " index: " + "\(index)")
                
                //continue here: something is wrong with the path conversion, try a simpler cubic curve test with stroke. etc
                
                CGPathAddCurveToPoint(cgPath, nil, path.pathData[index],path.pathData[index+1], path.pathData[index+2],path.pathData[index+3], path.pathData[index+4], path.pathData[index+5])
                index += 6
                /**
                * NOTE: At the moment i dont think this takes largeFlag into account
                * NOTE: Arc-path-data-structure: xRadii,yRadii,rotation,largeArcFlag,sweepFlag,end.x,end.y,center.x,center.y
                */
            case PathCommand.arcTo:
                //Swift.print("prevEnd: " + "\(prevEnd)")
                //Swift.print("CGPathUtils.compile() arcTo: x:" + "\(path.pathData[index+5])" + " y:" + "\(path.pathData[index+6])")
                //Swift.print("path.pathData[index+0]: " + "\(path.pathData[index+0])")
                
                //Continue here: the bug is the bellow line, 
                //you need to use the index somehow, 
                //try to improve the arcAt method, 
                //why doesnt it use prevEnd as the start for instance. 
                //see legacy code to figure this one out
                
                let arc:IArc = BasicPathParser.arcAt(path,0)
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
        let pathDataIndex:Int = BasicPathDataParser.index(path.commands, commandIndex)
        let start:CGPoint = commandIndex > 0 ? BasicPathDataParser.end(path, commandIndex-1) : CGPoint()
        return BasicPathDataParser.arcAt(path.pathData, pathDataIndex, start)
    }
}
private class BasicPathDataParser{
    /**
     * Returns the pathDataIndex based on the @param commandIndex
     */
    class func index(commands:Array<Int>,_ commandIndex:Int) -> Int {
        var pathDataIndex:Int = 0;
        for (var i : Int = 0; i < commandIndex; i++) {pathDataIndex += BasicCommandParser.commandLength(commands[i])}
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
    /**
     * @Note: the CLOSE case should probably be dealt with by the caller
     * // :TODO: for the close case we could also iterate backward to find the last MT???
     */
    class func endAt(pathData:Array<CGFloat>, _ pathDataIndex:Int, _ commandType:Int) -> CGPoint{// :TODO: move somewhere else? and rename?
        if(commandType == PathCommand.MOVE_TO || commandType == PathCommand.LINE_TO || commandType == PathCommand.WIDE_MOVE_TO || commandType == PathCommand.WIDE_LINE_TO) {return CGPoint(pathData[pathDataIndex],pathData[pathDataIndex+1])}
        else if(commandType == PathCommand.ARC_TO) {return CGPoint(pathData[pathDataIndex+5],pathData[pathDataIndex+6])}
        else if(commandType == PathCommand.CURVE_TO) {return CGPoint(pathData[pathDataIndex+2],pathData[pathDataIndex+3])}
        else if(commandType == PathCommand.CLOSE) {return CGPoint(NaN,NaN)}/*used to be null*/
        else {fatalError("PathCommand not yet supported")}//PathCommand.CUBIC_CURVE_TO// :TODO: not supported yet
    }
    /**
     * Returns a IArc5 instance derived from @param pathData at @param index
     * @param pathDataIndex is the index in the pathData not the commandIndex
     * @param start is the start position of the prev command
     * @Note this function is used in the SelectPath4 draw functions
     * @Note the Function PathParser.arcAt does the same thing but by looking at the commandIndex instead
     * // :TODO: the start is the end of prev command
     */
    class func arcAt(pathData:Array<CGFloat>,_ pathDataIndex:Int,_ start:CGPoint)->IArc {
        //Swift.print("START: " + start);
        return Arc(start, pathData[pathDataIndex], pathData[pathDataIndex+1], pathData[pathDataIndex+2], Bool(pathData[pathDataIndex+3]), Bool(pathData[pathDataIndex+4]), CGPoint(pathData[pathDataIndex+5],pathData[pathDataIndex+6]), CGPoint(pathData[pathDataIndex+7],pathData[pathDataIndex+8]))
    }
}
private class BasicCommandParser{
    /**
     * Returns the number of parameters for a specific command type
     * // :TODO: include GraphicsPathCommand.CUBIC_CURVE_TO when that is due for implimentation
     * // :TODO: isnt this function superflousouse since you can just trace the actual command and get the same value?
     */
    class func commandLength(command:Int)->Int {
        if(command == PathCommand.CLOSE || command == PathCommand.NO_OP) {return 0}
        else if(command == PathCommand.CURVE_TO) {return 4}
        else if(command == PathCommand.ARC_TO) {return 9}
        else if(command == PathCommand.CUBIC_CURVE_TO) {return 8}
        else {return 2}/*MOVE_TO LINE_TO WIDE_MOVE_TO WIDE_LINE_TO*/
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
        
        Swift.print("CGPathUtils.compile() startAngle: " + "\(startAngle)")
        let endAngle:CGFloat = TrigParser.angle(center, end)
        
        Swift.print("CGPathUtils.compile() endAngle: " + "\(endAngle)")
        let clockwise:Bool =  path.pathData[index+4] == 1
        Swift.print("CGPathUtils.compile() clockwise: " + "\(clockwise)")
        let delta = TrigParser.angleSpan2(startAngle, endAngle, clockwise)//use angleSpan to find the diff between start and end angles
        Swift.print("CGPathUtils.compile() delta: " + "\(delta)")
        
        //CGPathAddArc(cgPath, nil, center.x,center.y, path.pathData[index+0]/*<-radius*/, startAngle,endAngle ,clockwise/**//*<-clockwise*/)
        cgPath.addRelativeArc(center, path.pathData[index+0], startAngle, delta, nil)
        //CGPathAddLineToPoint(cgPath,nil,path.pathData[index+5],path.pathData[index+6])
        
    }
}


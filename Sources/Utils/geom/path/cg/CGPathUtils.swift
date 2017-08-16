import Foundation

class CGPathUtils {
    /**
     * Compiles a CGPath from a Path
     * TODO: should the cgPath be inout? test this theory
     * TODO: Create an extension for CGPath so you can do cgPath.lineTo(0,0) etc, much cleaner
     * NOTE: the CGPathAddArc method doesnt seem to support drawing from negative area to positive area. The CGPathAddRelativeArc method supports this
     */
    static func compile(_ cgPath:CGMutablePath, _ path:PathKind) -> CGMutablePath{
        var idx:Int = 0/*pathDataIndex*/
        var prevMT:CGPoint = CGPoint()/*for the closed path support*/
        var prevEnd:CGPoint = CGPoint()
        let cmdLen:Int = path.commands.count
        for i in 0..<cmdLen{
            let command:Int = path.commands[i]
            switch(PathCommand(rawValue:command)){
                case .moveTo?:
                    prevMT = CGPoint(path.pathData[idx], path.pathData[idx + 1])
                    prevEnd = prevMT.copy()
                    cgPath.move(to: CGPoint(prevEnd.x,prevEnd.y))
                    idx += 2
                case .lineTo?:
                    prevEnd = CGPoint(path.pathData[idx], path.pathData[idx + 1])
                    cgPath.addLine(to: CGPoint(path.pathData[idx],path.pathData[idx + 1]))
                    idx += 2
                case .curveTo?:/*quad*/
                    prevEnd = CGPoint(path.pathData[idx + 0], path.pathData[idx + 1])
                    cgPath.addQuadCurve(to: CGPoint(path.pathData[idx],path.pathData[idx + 1]), control: CGPoint(path.pathData[idx + 2],path.pathData[idx + 3]))//swift 3->was: CGPathAddQuadCurveToPoint
                    idx += 4
                case .cubicCurveTo?:/*cubic*/
                    prevEnd = CGPoint(path.pathData[idx + 0], path.pathData[idx + 1])
                    //the bellow could be wrong
                    //Swift.print("path.pathData.count: " + "\(path.pathData.count)" + " index: " + "\(index)")
                    //continue here: something is wrong with the path conversion, try a simpler cubic curve test with stroke. etc
                    cgPath.addCurve(to: CGPoint(path.pathData[idx],path.pathData[idx + 1]), control1: CGPoint(path.pathData[idx + 2],path.pathData[idx + 3]), control2: CGPoint(path.pathData[idx + 4],path.pathData[idx + 5]))//CGPathAddCurveToPoint
                    idx += 6
                    /**
                     * NOTE: At the moment i dont think this takes largeFlag into account
                     * NOTE: Arc-path-data-structure: xRadii,yRadii,rotation,largeArcFlag,sweepFlag,end.x,end.y,center.x,center.y
                     */
                case .arcTo?:
                    //Swift.print("prevEnd: " + "\(prevEnd)")
                    //Swift.print("CGPathUtils.compile() arcTo: x:" + "\(path.pathData[index+5])" + " y:" + "\(path.pathData[index+6])")
                    //Swift.print("path.pathData[index+0]: " + "\(path.pathData[index+0])")
                    let arc:IArc = BasicPathParser.arcAt(path,i)
                    /*
                    Swift.print("describeArc")
                    ArcParser.describe(arc)
                    Swift.print("")
                    */
                    DisplayArcUtils.arcTo(cgPath,arc)
                    prevEnd = arc.end.copy()/*<--I think this should be start*/
                    idx += 9
                case .close?:/*for the closed path support*/
                    if(prevEnd != prevMT) {/*<--draw a line to the prevMT if end isnt above prevMT*/
                        //Swift.print("ADD AN EXTRA CLOSE LINE")
                        cgPath.addLine(to: CGPoint(prevMT.x,prevMT.y))//Swift 3 was->CGPathAddLineToPoint
                    }
                    cgPath.closeSubpath()
                    cgPath.move(to: CGPoint(prevMT.x, prevMT.y))/*<--unsure if this is needed?*///upgraded to swift 3:->was:CGPathMoveToPoint
                default:
                    break;
            }
        }
        return cgPath
    }
}

private class BasicPathParser{
    static func arcAt(_ path:PathKind,_ commandIndex:Int) -> IArc{
        let pathDataIndex:Int = BasicPathDataParser.index(path.commands, commandIndex)
        let start:CGPoint = commandIndex > 0 ? BasicPathDataParser.end(path, commandIndex-1) : CGPoint()
        return BasicPathDataParser.arcAt(path.pathData, pathDataIndex, start)
    }
}
private class BasicPathDataParser{
    /**
     * Returns the pathDataIndex based on the PARAM: commandIndex
     */
    static func index(_ commands:[Int],_ commandIndex:Int) -> Int {
        return (0..<commandIndex).indices.reduce(0){ pathDataIndex,i in
            return pathDataIndex + BasicCommandParser.commandLength(commands[i])
        }
    }
    /**
     * Returns the destination end position of a given command at PARAM: commandIndex in PARAM: commands
     * PARAM: index the index of the command
     * NOTE: this is cpu intensive to call if you are iterating over an array
     * TODO: ⚠️️ START USING END2 which supports CLOSE
     */
    static func end(_ path:PathKind, _ commandIndex:Int) -> CGPoint {// :TODO: rename to position?!? or maybe point?
        let command:Int = path.commands[commandIndex]
        let pathDataIndex:Int = BasicPathDataParser.index(path.commands, commandIndex)
        return endAt(path.pathData, pathDataIndex, command)
    }
    /**
     * NOTE: the CLOSE case should probably be dealt with by the caller
     * TODO: for the close case we could also iterate backward to find the last MT???
     */
    static func endAt(_ pathData:[CGFloat], _ pathDataIndex:Int, _ commandType:Int) -> CGPoint{// :TODO: move somewhere else? and rename?
        switch PathCommand(rawValue:commandType){
            case .moveTo?,.lineTo?,.wideMoveTo?,.wideLineTo?:
                return CGPoint(pathData[pathDataIndex],pathData[pathDataIndex+1])
            case .arcTo?:
                return CGPoint(pathData[pathDataIndex+5],pathData[pathDataIndex+6])
            case .curveTo?:
                return CGPoint(pathData[pathDataIndex+2],pathData[pathDataIndex+3])
            case .close?:
                return CGPoint(NaN,NaN)/*used to be nil*/
            default:
                fatalError("PathCommand not yet supported")//PathCommand.CUBIC_CURVE_TO// :TODO: not supported yet
        }
    }
    /**
     * Returns a IArc5 instance derived from PARAM: pathData at PARAM: index
     * PARAM: i: is the pathDataIndex is the index in the pathData not the commandIndex
     * PARAM: start is the start position of the prev command
     * NOTE: this function is used in the SelectPath4 draw functions
     * NOTE: the Function PathParser.arcAt does the same thing but by looking at the commandIndex instead
     * TODO: the start is the end of prev command
     */
    static func arcAt(_ pathData:[CGFloat],_ i:Int,_ start:CGPoint)->IArc {
        return Arc(start, pathData[i], pathData[i+1], pathData[i+2], Bool(pathData[i+3]), Bool(pathData[i+4]), CGPoint(pathData[i+5],pathData[i+6]), CGPoint(pathData[i+7],pathData[i+8]))
    }
}
private class BasicCommandParser{
    /**
     * Returns the number of parameters for a specific command type
     * TODO: ⚠️️ Include GraphicsPathCommand.CUBIC_CURVE_TO when that is due for implimentation
     * TODO: ⚠️️ Isn't this function superflousouse since you can just trace the actual command and get the same value?
     */
    static func commandLength(_ command:Int)->Int {
        switch PathCommand(rawValue:command){
            case .close?,.noOp?:
                return 0
            case .curveTo?:
                return 4
            case .arcTo?:
                return 9
            case .cubicCurveTo?:
                return 8
            default:/*MOVE_TO LINE_TO WIDE_MOVE_TO WIDE_LINE_TO*/
                return 2
        }
    }
}

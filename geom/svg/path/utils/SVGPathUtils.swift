import Foundation

class SVGPathUtils {
    /**
     * Returns a SVGPath instance with data derived frompa commands and @param params (which contains numbers, as in pathData)
     * // :TODO: may not work 100%
     */
    class func function path(commands:Array<String>,_ params:Array<CGFloat>)->IPath {
        var path:IPath = PathParser.empty();
        var i:int = 0;/*parameterIndex*/
        var prevP:Point = new Point();
        var prevM:Point;/*previous MoveTo pos*/
        var prevC:Point;/*previous ControlPoint*/
        for (var e : int = 0; e < commands.length; e++) {
            var command:String = commands[e];
            var isLowerCase:Boolean = StringAsserter.lowerCase(command);
            var pos:Point = isLowerCase ? prevP.clone() : new Point();/*the current end pos*/
            switch(command.toLocaleLowerCase()){
                case SVGPathCommand.M: //moveTo
                    pos = prevM = pos.add(new Point(params[i],params[i+1]));
                    path.commands.push(PathCommand.MOVE_TO);
                    path.pathData.push(pos.x,pos.y);
                    i +=2;
                    break;
                case SVGPathCommand.L: //lineTo
                    pos = pos.add(new Point(params[i],params[i+1]));
                    path.commands.push(PathCommand.LINE_TO);
                    path.pathData.push(pos.x,pos.y);
                    i +=2;
                    break;
                case SVGPathCommand.H://horizontalLineTo
                    pos = pos.add(new Point(params[i],isLowerCase ? 0 : prevP.y));
                    path.commands.push(PathCommand.LINE_TO);
                    path.pathData.push(pos.x,pos.y);
                    i++;
                    break;
                case SVGPathCommand.V://verticalLineTo
                    pos = pos.add(new Point(isLowerCase ? 0 : prevP.x,params[i]));
                    path.commands.push(PathCommand.LINE_TO);
                    path.pathData.push(pos.x,pos.y);
                    i++;
                    break;
                case SVGPathCommand.C://cubicCurveTo
                    pos = pos.add(new Point(params[i+4],params[i+5]));
                    var controlP1:Point = isLowerCase ? new Point(prevP.x + Number(params[i]),prevP.y+Number(params[i+1])) : new Point(params[i],params[i+1]);
                    prevC = isLowerCase ? new Point(prevP.x+Number(params[i+2]),prevP.y+Number(params[i+3])) : new Point(params[i+2],params[i+3]);/*aka controlP2*/
                    path.commands.push(PathCommand.CUBIC_CURVE_TO);
                    path.pathData.push(controlP1.x,controlP1.y, prevC.x,prevC.y, pos.x,pos.y);
                    i +=6;
                    break;
                case SVGPathCommand.S://smoothCubicCurveTo
                    pos = pos.add(new Point(params[i+2],params[i+3]));
                    var cP1:Point = new Point(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    prevC = isLowerCase ? new Point(Number(params[i])+prevP.x,Number(params[i+1])+prevP.y) : new Point(params[i],params[i+1]);
                    path.commands.push(PathCommand.CUBIC_CURVE_TO);
                    path.pathData.push(cP1.x,cP1.y, prevC.x,prevC.y, pos.x,pos.y);
                    i +=4;
                    break;
                case SVGPathCommand.Q: //quadCurveTo
                    pos = pos.add(new Point(params[i+2],params[i+3]));
                    prevC = isLowerCase ? new Point(prevP.x+params[i],prevP.y+params[i+1]) : new Point(params[i],params[i+1]);
                    path.commands.push(PathCommand.CURVE_TO);
                    path.pathData.push(cP1.x,cP1.y, pos.x,pos.y);
                    i +=4;
                    break;
                case SVGPathCommand.T://smoothCubicCurveTo/*the new control point x2, y2 is calculated from the curve's starting point x, y and the previous control point x1, y1 with these formulas:*/
                    pos = pos.add(new Point(params[i],params[i+1]));
                    prevC = new Point(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    path.commands.push(PathCommand.CURVE_TO);
                    path.pathData.push(cP1.x,cP1.y, pos.x,pos.y);
                    i +=2;
                    break;
                case SVGPathCommand.Z: path.commands.push(PathCommand.CLOSE); break;/*closes it self to the prev MT pos*/
//					case PathCommand.ARC_TO:
//						DisplayArc4Modifier.arcTo(graphics, path.params[i], path.params[i+1], path.params[i+2], path.params[i+3],path.params[i+4], path.params[i+5],path.params[i+6]);
//						i += 7;
//						break;
            }
            if(e < commands.length-1 /*&& StringAsserter.lowerCase(commands[i+1])*/) {// :TODO: check for z?
                prevP = pos.clone();
            }
        }
        return path;
    }
}
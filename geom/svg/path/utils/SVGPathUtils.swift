import Foundation

class SVGPathUtils {
    /**
     * Returns a SVGPath instance with data derived frompa commands and @param params (which contains numbers, as in pathData)
     * // :TODO: may not work 100%
     */
    class func path(commands:Array<String>,_ params:Array<CGFloat>)->CGMutablePathRef {
        let path:CGMutablePathRef = CGPathCreateMutable()
        var i:Int = 0;/*parameterIndex*/
        var prevP:CGPoint = CGPoint();
        var prevM:CGPoint;/*previous MoveTo pos*/
        var prevC:CGPoint;/*previous ControlPoint*/
        for (var e : Int = 0; e < commands.count; e++) {
            var command:String = commands[e];
            var isLowerCase:Bool = StringAsserter.lowerCase(command);
            var pos:CGPoint = isLowerCase ? prevP.copy() : CGPoint();/*the current end pos*/
            switch(command.lowercaseString){
                case SVGPathCommand.m: //moveTo
                    pos = prevM = pos.add(CGPoint(params[i],params[i+1]));
                    path.commands.append(PathCommand.MOVE_TO);
                    path.pathData.append(pos.x,pos.y);
                    i += 2;
                    break;
                case SVGPathCommand.l: //lineTo
                    pos += CGPoint(params[i],params[i+1]);
                    path.commands.append(PathCommand.LINE_TO);
                    path.pathData.append(pos.x,pos.y);
                    i += 2;
                    break;
                case SVGPathCommand.h://horizontalLineTo
                    pos = pos.add(CGPoint(params[i],isLowerCase ? 0 : prevP.y));
                    path.commands.append(PathCommand.LINE_TO);
                    path.pathData.append(pos.x,pos.y);
                    i++;
                    break;
                case SVGPathCommand.V://verticalLineTo
                    pos = pos.add(CGPoint(isLowerCase ? 0 : prevP.x,params[i]));
                    path.commands.append(PathCommand.LINE_TO);
                    path.pathData.append(pos.x,pos.y);
                    i++;
                    break;
                case SVGPathCommand.C://cubicCurveTo
                    pos = pos.add(CGPoint(params[i+4],params[i+5]));
                    var controlP1:CGPoint = isLowerCase ? CGPoint(prevP.x + Number(params[i]),prevP.y+Number(params[i+1])) : CGPoint(params[i],params[i+1]);
                    prevC = isLowerCase ? CGPoint(prevP.x+Number(params[i+2]),prevP.y+Number(params[i+3])) : CGPoint(params[i+2],params[i+3]);/*aka controlP2*/
                    path.commands.append(PathCommand.CUBIC_CURVE_TO);
                    path.pathData.append(controlP1.x,controlP1.y, prevC.x,prevC.y, pos.x,pos.y);
                    i +=6;
                    break;
                case SVGPathCommand.S://smoothCubicCurveTo
                    pos = pos.add(CGPoint(params[i+2],params[i+3]));
                    var cP1:CGPoint = CGPoint(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    prevC = isLowerCase ? CGPoint(Number(params[i])+prevP.x,Number(params[i+1])+prevP.y) : CGPoint(params[i],params[i+1]);
                    path.commands.append(PathCommand.CUBIC_CURVE_TO);
                    path.pathData.append(cP1.x,cP1.y, prevC.x,prevC.y, pos.x,pos.y);
                    i +=4;
                    break;
                case SVGPathCommand.Q: //quadCurveTo
                    pos = pos.add(CGPoint(params[i+2],params[i+3]));
                    prevC = isLowerCase ? CGPoint(prevP.x+params[i],prevP.y+params[i+1]) : CGPoint(params[i],params[i+1]);
                    path.commands.append(PathCommand.CURVE_TO);
                    path.pathData.append(cP1.x,cP1.y, pos.x,pos.y);
                    i +=4;
                    break;
                case SVGPathCommand.T://smoothCubicCurveTo/*the new control point x2, y2 is calculated from the curve's starting point x, y and the previous control point x1, y1 with these formulas:*/
                    pos = pos.add(CGPoint(params[i],params[i+1]));
                    prevC = CGPoint(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    path.commands.append(PathCommand.CURVE_TO);
                    path.pathData.append(cP1.x,cP1.y, pos.x,pos.y);
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
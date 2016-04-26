import Foundation

class SVGPathUtils {
    /**
     * Draws a path on @param graphics with data from @param parameters
     * @Note: this method also handles the uppercase and lowercase difference in the SVG syntax
     * // :TODO: the relative stuff is beta, might need a more robust solution like checking what the last command was and querrying lastPosition(commandINdex,commands,pathdata)
     * // :TODO: impliment quadTo
     */
    class func drawPath(/*inout*/ path:CGMutablePathRef, _ commands:Array<String>,_ params:Array<CGFloat>)->CGMutablePathRef{
        var i:Int = 0;/*parameterIndex*/
        var prevP:CGPoint = CGPoint();
        var prevM:CGPoint!;/*previous MoveTo pos*/
        var prevC:CGPoint!;/*previous ControlPoint*/
        for (var e : Int = 0; e < commands.count; e++) {
            //Swift.print("commands.count: " + "\(commands.count)")
            //Swift.print("params.count: " + "\(params.count)")
            let command:String = commands[e]
            let isLowerCase:Bool = StringAsserter.lowerCase(command)
            //Swift.print("SVGPathUtils.drawPath() isLowerCase: " + "\(isLowerCase)")
            var pos:CGPoint = isLowerCase ? prevP.copy() : CGPoint();/*the current end pos*/
            switch(command.lowercaseString){
                case SVGPathCommand.m: //moveTo
                    //Swift.print("moveTo")
                    pos += CGPoint(params[i],params[i+1]);
                    prevM = pos.copy()
                    CGPathMoveToPoint(path, nil, pos.x,pos.y)
                    i += 2;
                    break;
                case SVGPathCommand.l: //lineTo
                    pos += CGPoint(params[i],params[i+1])
                    CGPathAddLineToPoint(path,nil,pos.x,pos.y)
                    i += 2
                    break;
                case SVGPathCommand.h://horizontalLineTo
                    pos += CGPoint(params[i],isLowerCase ? 0 : prevP.y)
                    CGPathAddLineToPoint(path,nil,pos.x,pos.y)
                    i++;
                    break;
                case SVGPathCommand.v://verticalLineTo
                    pos += CGPoint(isLowerCase ? 0 : prevP.x,params[i])
                    CGPathAddLineToPoint(path,nil,pos.x,pos.y)
                    i++
                    break;
                case SVGPathCommand.c://curveTo
                    //Swift.print("curveTo: " + " i: \(i) params: " + "\(params)")
                    pos += CGPoint(params[i+4],params[i+5])
                    let controlP1:CGPoint = isLowerCase ? CGPoint(prevP.x + params[i],prevP.y+params[i+1]) : CGPoint(params[i],params[i+1]);
                    //Swift.print("controlP1: " + "\(controlP1)")
                    prevC = isLowerCase ? CGPoint(prevP.x + params[i+2],prevP.y+params[i+3]) : CGPoint(params[i+2],params[i+3]);/*aka controlP2*/
                    //Swift.print("prevC: " + "\(prevC)")
                    CGPathAddCurveToPoint(path, nil, controlP1.x, controlP1.y, prevC.x, prevC.y, pos.x, pos.y)//CubicCurveModifier.cubicCurveTo(graphics, prevP, controlP1, prevC, pos);
                    i += 6;
                    break;
                case SVGPathCommand.s://smoothCurveTo
                    pos += CGPoint(params[i+2],params[i+3])
                    let cP1:CGPoint = CGPoint(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    prevC = isLowerCase ? CGPoint(CGFloat(params[i])+prevP.x,CGFloat(params[i+1])+prevP.y) : CGPoint(params[i],params[i+1]);
                    CGPathAddCurveToPoint(path, nil, cP1.x, cP1.y, prevC.x, prevC.y, pos.x, pos.y)//CubicCurveModifier.cubicCurveTo(graphics, prevP, cP1, prevC, pos);
                    i += 4;//<---shouldnt this also be 6, maybe not actually, there is no i+4 or i+5!?!
                    break;
                case SVGPathCommand.q: //quadCurveTo
                    pos += CGPoint(params[i+2],params[i+3])
                    prevC = isLowerCase ? CGPoint(prevP.x+params[i],prevP.y+params[i+1]) : CGPoint(params[i],params[i+1])
                    CGPathAddQuadCurveToPoint(path, nil, prevC.x, prevC.y, pos.x, pos.y)
                    i += 4
                    break;
                case SVGPathCommand.t://smoothQuadCurveTo /*the new control point x2, y2 is calculated from the curve's starting point x, y and the previous control point x1, y1 with these formulas:*/
                    pos += CGPoint(params[i],params[i+1])
                    prevC = CGPoint(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y)/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    CGPathAddQuadCurveToPoint(path, nil, prevC.x, prevC.y, pos.x, pos.y)
                    i += 2;
                    break;
                case SVGPathCommand.z:
                    //Swift.print("close path")
                    CGPathCloseSubpath(path);
                    CGPathMoveToPoint(path, nil, prevM.x, prevM.y)/*<--unsure if this is needed?*/
                    break;/*closes it self to the prev MT pos*/
                    //					case PathCommand.ARC_TO:
                    //						DisplayArc4Modifier.arcTo(graphics, path.params[i], path.params[i+1], path.params[i+2], path.params[i+3],path.params[i+4], path.params[i+5],path.params[i+6]);
                    //						i += 7;
                    //						break;
                default: break
            }
            if(e < commands.count-1 /*&& StringAsserter.lowerCase(commands[i+1])*/) {// :TODO: check for z?
                prevP = pos.copy();
            }
        }
        return path
    }
    /**
     * Returns a SVGPath instance with data derived frompa commands and @param params (which contains numbers, as in pathData)
     * // :TODO: may not work 100%
     */
    class func path(commands:Array<String>,_ params:Array<CGFloat>)->IPath {
        var path:IPath = Path()
        var i:Int = 0;/*parameterIndex*/
        var prevP:CGPoint = CGPoint();
        //var prevM:CGPoint/*previous MoveTo pos*/
        var prevC:CGPoint!/*previous ControlPoint*/
        for (var e : Int = 0; e < commands.count; e++) {
            let command:String = commands[e];
            let isLowerCase:Bool = StringAsserter.lowerCase(command);
            var pos:CGPoint = isLowerCase ? prevP.copy() : CGPoint();/*the current end pos*/
            switch(command.lowercaseString){
                case SVGPathCommand.m: //moveTo
                    pos += CGPoint(params[i],params[i+1]);
                    //prevM = pos.copy()
                    path.commands.append(PathCommand.MOVE_TO);
                    path.pathData += [pos.x,pos.y]/*<-- used to be path.pathData.append(pos.x,pos.y);*/
                    i += 2;
                    break;
                case SVGPathCommand.l: //lineTo
                    pos += CGPoint(params[i],params[i+1]);
                    path.commands.append(PathCommand.LINE_TO);
                    path.pathData += [pos.x,pos.y]
                    i += 2;
                    break;
                case SVGPathCommand.h://horizontalLineTo
                    pos += CGPoint(params[i],isLowerCase ? 0 : prevP.y)
                    path.commands.append(PathCommand.LINE_TO);
                    path.pathData += [pos.x,pos.y]
                    i++;
                    break;
                case SVGPathCommand.v://verticalLineTo
                    pos += CGPoint(isLowerCase ? 0 : prevP.x,params[i]);
                    path.commands.append(PathCommand.LINE_TO);
                    path.pathData += [pos.x,pos.y]
                    i++;
                    break;
                case SVGPathCommand.c://cubicCurveTo
                    pos += CGPoint(params[i+4],params[i+5]);
                    let controlP1:CGPoint = isLowerCase ? CGPoint(prevP.x + CGFloat(params[i]),prevP.y+CGFloat(params[i+1])) : CGPoint(params[i],params[i+1]);
                    prevC = isLowerCase ? CGPoint(prevP.x+CGFloat(params[i+2]),prevP.y+CGFloat(params[i+3])) : CGPoint(params[i+2],params[i+3]);/*aka controlP2*/
                    path.commands.append(PathCommand.CUBIC_CURVE_TO);
                    path.pathData += [controlP1.x,controlP1.y, prevC.x,prevC.y, pos.x,pos.y]
                    i += 6;
                    break;
                case SVGPathCommand.s://smoothCubicCurveTo
                    pos += CGPoint(params[i+2],params[i+3]);
                    let cP1:CGPoint = CGPoint(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    prevC = isLowerCase ? CGPoint(CGFloat(params[i])+prevP.x,CGFloat(params[i+1])+prevP.y) : CGPoint(params[i],params[i+1]);
                    path.commands.append(PathCommand.CUBIC_CURVE_TO);
                    path.pathData += [cP1.x,cP1.y, prevC.x,prevC.y, pos.x,pos.y]
                    i += 4;
                    break;
                case SVGPathCommand.q: //quadCurveTo
                    pos += CGPoint(params[i+2],params[i+3]);
                    prevC = isLowerCase ? CGPoint(prevP.x+params[i],prevP.y+params[i+1]) : CGPoint(params[i],params[i+1]);
                    path.commands.append(PathCommand.CURVE_TO);
                    path.pathData += [prevC.x,prevC.y, pos.x,pos.y]
                    i += 4;
                    break;
                case SVGPathCommand.t://smoothCubicCurveTo/*the new control point x2, y2 is calculated from the curve's starting point x, y and the previous control point x1, y1 with these formulas:*/
                    pos += CGPoint(params[i],params[i+1])
                    prevC = CGPoint(2 * prevP.x - prevC.x,2 * prevP.y - prevC.y);/*x2 = 2 * x - x1 and y2 = 2 * y - y1*/
                    path.commands.append(PathCommand.CURVE_TO);
                    path.pathData += [prevC.x,prevC.y, pos.x,pos.y]
                    i += 2;
                    break;
                case SVGPathCommand.z: path.commands.append(PathCommand.CLOSE); break;/*closes it self to the prev MT pos*/
//					case PathCommand.ARC_TO:
//						DisplayArc4Modifier.arcTo(graphics, path.params[i], path.params[i+1], path.params[i+2], path.params[i+3],path.params[i+4], path.params[i+5],path.params[i+6]);
//						i += 7;
//						break;
                default: fatalError("type not supported");
            }
            if(e < commands.count-1 /*&& StringAsserter.lowerCase(commands[i+1])*/) {// :TODO: check for z?
                prevP = pos.copy();
            }
        }
        return path;
    }
    /**
     * Returns an Rectangle instance with data derived from a svgRect
     * @Note: if the svgRect x and or y is of the value NaN, then these are transfered as 0
     */
    class func rectangle(svgRect:SVGRect) -> CGRect {
        return CGRect(!svgRect.x.isNaN ? svgRect.x : 0, !svgRect.y.isNaN ? svgRect.y : 0, svgRect.width, svgRect.height)
    }
}
/**
CGPathAddCurveToPoint
NOTE: more info like the bellow here: https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CGPath/#//apple_ref/c/func/CGPathAddCurveToPoint
The mutable path to change. The path must not be empty.
m
A pointer to an affine transformation matrix, or NULL if no transformation is needed. If specified, Quartz applies the transformation to the curve before it is added to the path.
cp1x
The x-coordinate of the first control point.
cp1y
The y-coordinate of the first control point.
cp2x
The x-coordinate of the second control point.
cp2y
The y-coordinate of the second control point.
x
The x-coordinate of the end point of the curve.
y
The y-coordinate of the end point of the curve.
*/
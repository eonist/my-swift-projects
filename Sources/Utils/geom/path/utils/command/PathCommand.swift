import Foundation
/**
 * TODO: Set the values to the actual int not a pointer, one les cycle to call
 * TODO: Use uint?
 * TODO: Rename to noOp,moveTo,lineTo etc. 
 * TODO: DEPRECATE: ⚠️️ the uppercase constants
 * TODO: This is a great candidate for enum <--speed 👌
 * TODO: Or extend Int and get .syntaxt power
 */
class PathCommand {
    static var NO_OP:Int = 0/*0 Represents the default "do nothing" command.*/
    static var MOVE_TO:Int = 1/*1 Specifies a drawing command that moves the current drawing position to the x- and y-coordinates specified in the data vector. This command produces the same effect as the Graphics.moveTo() method, and uses one point in the data vector: (x,y).*/
    static var LINE_TO:Int = 2/*2 Specifies a drawing command that draws a line from the current drawing position to the x- and y-coordinates specified in the data vector. This command produces the same effect as the Graphics.lineTo() method, and uses one point in the data vector: (x,y).*/
    static var CURVE_TO:Int = 3/*3 (4 values) Specifies a drawing command that draws a curve from the current drawing position to the x- and y-coordinates specified in the data vector, using a control point. This command produces the same effect as the Graphics.lineTo() method, and uses two points in the data vector control and anchor: (cx, cy, ax, ay ).*/
    static var WIDE_MOVE_TO:Int = 4/* 4 Specifies a "move to" drawing command, but uses two sets of coordinates (four values) instead of one set. This command allows you to switch between "move to" and "curve to" commands without changing the number of data values used per command. This command uses two sets in the data vector: one dummy location and one (x,y) location. The WIDE_LINE_TO and WIDE_MOVE_TO command variants consume the same number of parameters as does the CURVE_TO command.*/
    static var WIDE_LINE_TO:Int = 5/* 5 Specifies a "line to" drawing command, but uses two sets of coordinates (four values) instead of one set. This command allows you to switch between "line to" and "curve to" commands without changing the number of data values used per command. This command uses two sets in the data vector: one dummy location and one (x,y) location. The WIDE_LINE_TO and WIDE_MOVE_TO command variants consume the same number of parameters as does the CURVE_TO command.*/
    static var CUBIC_CURVE_TO:Int = 6/*GraphicsPathCommand.CUBIC_CURVE_TO:int = 6, (8 values)  Specifies a drawing command that draws a curve from the current drawing position to the x- and y-coordinates specified in the data vector, using a 2 control points*/
    static var ARC_TO:Int = 7//7 (9 values)// :TODO: center can be generated cant it? then it should be 7 values /*startX,startY,xRadii,yRadii,rotation,largeArcFlag,sweepFlag,endX,endY,centerX,centerY*/
    static var CLOSE:Int = 8/*Similar to how Z works in svg, you need this to differenciate between 2 points in the same place and 2 points in the same place that is actually 1, when its moved etc*/
}
extension PathCommand{
    static var noOp:Int = PathCommand.NO_OP
    static var moveTo:Int = PathCommand.MOVE_TO
    static var lineTo:Int = PathCommand.LINE_TO
    static var curveTo:Int = PathCommand.CURVE_TO/*Quad*/
    static var wideMoveTo:Int = PathCommand.WIDE_MOVE_TO
    static var wideLineTo:Int = PathCommand.WIDE_LINE_TO
    static var cubicCurveTo:Int = PathCommand.CUBIC_CURVE_TO/*Cubic*/
    static var arcTo:Int = PathCommand.ARC_TO
    static var close:Int = PathCommand.CLOSE
}

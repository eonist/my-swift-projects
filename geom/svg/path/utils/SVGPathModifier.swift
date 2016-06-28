import Foundation
/*
 * // :TODO: impliment graphics.drawGraphicsData
 */
class SVGPathModifier {
    /**
     * Scales @param path at @param pivot with @param scalePoint
     * @Note: I guess the reason to use scalePoint and not a scalar value (0-1) is because scalePoint is more precise
     * // :TODO: discuss why you use scalePoint and not scalar value in more detail.
     * // :TODO: create a method in NumberModifer named scale that takes value:Number,pivot:Number,scale:Number
     */
    class func scale(path:SVGPath,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        var i:Int = 0;/*parameterIndex*/
        var commands:Array<String> = path.commands;
        var params:Array<CGFloat> = path.parameters;
        var p:CGPoint;
        var c1:CGPoint;
        var c2:CGPoint;
        var a2:CGPoint;
        for (var e : Int = 0; e < commands.count; e++) {
            let command:String = commands[e];
            switch(command.lowercaseString){
            case SVGPathCommand.l,SVGPathCommand.m://<-this may need testing since it may be || instead of ,
                p = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                path.parameters[i] = p.x;
                path.parameters[i+1] = p.y;
                i += 2;
                break;
            case SVGPathCommand.h:
                p = PointModifier.scale(CGPoint(params[i],0), pivot, scalePoint);
                path.parameters[i] = p.x;
                i++;
                break;
            case SVGPathCommand.v:
                p = PointModifier.scale(CGPoint(0,params[i]), pivot, scalePoint);
                path.parameters[i] = p.y;
                i++;
                break;
            case SVGPathCommand.c:
                c1 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                c2 = PointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint);
                a2 = PointModifier.scale(CGPoint(params[i+4],params[i+5]), pivot, scalePoint);
                //						trace(e+" scale.c c1: "+c1 + " c2:"+c2+" a2:" + a2);
                path.parameters[i] = c1.x;
                path.parameters[i+1] = c1.y;
                path.parameters[i+2] = c2.x;
                path.parameters[i+3] = c2.y;
                path.parameters[i+4] = a2.x;
                path.parameters[i+5] = a2.y;
                i+=6;
                break;
            case SVGPathCommand.s:
                c2 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                a2 = PointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint);
                path.parameters[i] = c2.x;
                path.parameters[i+1] = c2.y;
                path.parameters[i+2] = a2.x;
                path.parameters[i+3] = a2.y;
                i+=4;
                break;
            case SVGPathCommand.q:
                c1 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                a2 = PointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint);
                path.parameters[i] = c1.x;
                path.parameters[i+1] = c1.y;
                path.parameters[i+2] = a2.x;
                path.parameters[i+3] = a2.y;
                i+=4;
                break;
            case SVGPathCommand.t:
                a2 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                path.parameters[i] = a2.x;
                path.parameters[i+1] = a2.y;
                i+=2;
                break;
            case SVGPathCommand.z: 
                /*do nothing*/
                break;
            default:break;
            }
        }
    }
}
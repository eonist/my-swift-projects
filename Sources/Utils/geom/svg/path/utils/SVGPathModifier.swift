import Foundation
/*
 * // :TODO: impliment graphics.drawGraphicsData
 */
class SVGPathModifier {
    /**
     * Scales PARAM: path at PARAM: pivot with PARAM: scalePoint
     * NOTE: I guess the reason to use scalePoint and not a scalar value (0-1) is because scalePoint is more precise
     * TODO: ⚠️️ discuss why you use scalePoint and not scalar value in more detail.
     * TODO: ⚠️️ create a method in NumberModifer named scale that takes value:Number,pivot:Number,scale:Number
     */
    static func scale(_ path:SVGPath,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        var i:Int = 0/*parameterIndex*/
        var commands:[String] = path.commands
        var params:[CGFloat] = path.parameters
        var p:CGPoint
        var c1:CGPoint
        var c2:CGPoint
        var a2:CGPoint
        for e in 0..<commands.count {
            let command:String = commands[e]
            switch(SVGPathCommand(rawValue:Character(command.lowercased()))){
                case .l?, .m?:
                    p = CGPointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint)
                    path.parameters[i] = p.x
                    path.parameters[i+1] = p.y
                    i += 2
                case .h?:
                    p = CGPointModifier.scale(CGPoint(params[i],0), pivot, scalePoint)
                    path.parameters[i] = p.x
                    i += 1
                    break;
                case .v?:
                    p = CGPointModifier.scale(CGPoint(0,params[i]), pivot, scalePoint)
                    path.parameters[i] = p.y
                    i += 1
                    break;
                case .c?:
                    c1 = CGPointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint)
                    c2 = CGPointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint)
                    a2 = CGPointModifier.scale(CGPoint(params[i+4],params[i+5]), pivot, scalePoint)
                    path.parameters[i] = c1.x
                    path.parameters[i+1] = c1.y
                    path.parameters[i+2] = c2.x
                    path.parameters[i+3] = c2.y
                    path.parameters[i+4] = a2.x
                    path.parameters[i+5] = a2.y
                    i+=6
                    break;
                case .s?:
                    c2 = CGPointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint)
                    a2 = CGPointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint)
                    path.parameters[i] = c2.x
                    path.parameters[i+1] = c2.y
                    path.parameters[i+2] = a2.x
                    path.parameters[i+3] = a2.y
                    i+=4;
                    break;
                case .q?:
                    c1 = CGPointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint)
                    a2 = CGPointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint)
                    path.parameters[i] = c1.x
                    path.parameters[i+1] = c1.y
                    path.parameters[i+2] = a2.x
                    path.parameters[i+3] = a2.y
                    i+=4;
                    break;
                case .t?:
                    a2 = CGPointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint)
                    path.parameters[i] = a2.x
                    path.parameters[i+1] = a2.y
                    i+=2
                    break;
                case .z?:
                    break;/*do nothing*/
                default:
                    break;
            }
        }
    }
}

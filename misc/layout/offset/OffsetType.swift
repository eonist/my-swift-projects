import Foundation
/*
* // :TODO: redesign this class like TRBL
*/
class OffsetType:ILayout{
    static var center:String = "center";// :TODO: move this to a class called OffsetType
    static var outside:String = "outside";
    static var inside:String = "inside";
    var left:String
    var right:String
    var top:String
    var bottom:String
    required init(_ params:Any...){
        let args:Array<String> = params as! Array<String>
        switch(args.count){
            case 0: left = OffsetType.center; right = OffsetType.center; top = OffsetType.center; bottom = OffsetType.center
            case 1: left = args[0]; right = args[0]; top = args[0]; bottom = args[0];
            case 2: left = args[0]; right = args[0];top = args[1]; bottom = args[1];
            case 3: left = args[0];right = args[1];top = args[2];bottom = OffsetType.center;
            default: left = args[0];right = args[1];top = args[2];bottom = args[3]; /*length >= 4*/
        }
    }
}


import Foundation
/**
 * A fillet is a class that represents the curved corners of a rectangle (DataContainer, Bean style class)
 * // :TODO: refactor to be TRBL or?
 */
class Fillet:ILayout {
    var topLeft:Double;
    var topRight:Double;
    var bottomLeft:Double;
    var bottomRight:Double;
    required init(_ params:Any...) {//TODO:you may need to add the _ char infront of args
        let args:Array<Double> = params as! Array<Double>//means to an end
        switch(args.count){
        case 0: topLeft = 0; topRight = 0; bottomLeft = 0; bottomRight = 0; break;
        case 1: topLeft = args[0];topRight = args[0];bottomLeft = args[0];bottomRight = args[0]; break;
        case 2: topLeft = args[0]; topRight = args[0];bottomLeft = args[1]; bottomRight = args[1]; break;
        case 3: topLeft = args[0];topRight = args[1];bottomLeft = args[2];bottomRight = 0; break;
        case 4: topLeft = args[0];topRight = args[1];bottomLeft = args[2];bottomRight = args[3]; break;
        default: fatalError("Argument length not supported: " + "\(args.count)");
        }
    }
}

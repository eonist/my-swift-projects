import Foundation
/**
 * A fillet is a class that represents the curved corners of a rectangle (DataContainer, Bean style class)
 * // :TODO: refactor to be TRBL or?
 */
class Fillet:ILayout {
    var topLeft:CGFloat;
    var topRight:CGFloat;
    var bottomLeft:CGFloat;
    var bottomRight:CGFloat;
    required init(_ args:Any...) {//TODO:you may need to add the _ char infront of args
        switch(args.count){
				case 0: topLeft = 0; topRight = 0; bottomLeft = 0; bottomRight = 0; break;
				case 1: topLeft = args[0] as! CGFloat;topRight = args[0] as! CGFloat;bottomLeft = args[0] as! CGFloat;bottomRight = args[0] as! CGFloat; break;
				case 2: topLeft = args[0] as! CGFloat; topRight = args[0] as! CGFloat;bottomLeft = args[1] as! CGFloat; bottomRight = args[1] as! CGFloat; break;
				case 3: topLeft = args[0] as! CGFloat;topRight = args[1] as! CGFloat;bottomLeft = args[2] as! CGFloat;bottomRight = 0; break;
				case 4: topLeft = args[0] as! CGFloat;topRight = args[1] as! CGFloat;bottomLeft = args[2] as! CGFloat;bottomRight = args[3] as! CGFloat; break;
				default: fatalError("Argument length not supported: " + "\(args.count)");
        }
    }
}

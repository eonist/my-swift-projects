import Foundation
/**
 * A fillet is a class that represents the curved corners of a rectangle (DataContainer, Bean style class)
 * // :TODO: refactor to be TRBL or?
 */
class Fillet {
    var _topLeft:Double;
    var _topRight:Double;
    var _bottomLeft:Double;
    var _bottomRight:Double;
    init(args:Double...) {
        switch(args.count){
				case 0: _topLeft = 0; _topRight = 0; _bottomLeft = 0; _bottomRight = 0; break;
				case 1: _topLeft = args[0];_topRight = args[0];_bottomLeft = args[0];_bottomRight = args[0]; break;
				case 2: _topLeft = args[0]; _topRight = args[0];_bottomLeft = args[1]; _bottomRight = args[1]; break;
				case 3: _topLeft = args[0];_topRight = args[1];_bottomLeft = args[2];_bottomRight = 0; break;
				case 4: _topLeft = args[0];_topRight = args[1];_bottomLeft = args[2];_bottomRight = args[3]; break;
				default: fatalError("Argument length not supported: " + "\(args.count)");
        }
    }
}

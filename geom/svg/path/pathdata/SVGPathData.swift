import Foundation
/**
 * This class serves as a data holder of SVGPath data, other SVGPath types extends this class to get access to it's methods
 */
class SVGPathData { 
	var commands:Array<String>//TODO:this could be [Character] and Not [String] r even [CommandType] <-- command type is an enum
	var parameters:Array<CGFloat>
	init(_ commands:Array<String>,_ parameters:Array<CGFloat>) {
		self.commands = commands
		self.parameters = parameters
	}
}
import Foundation
/**
 * This class serves as a data holder of SVGPath data, other SVGPath types extends this class to get access to it's methods
 */
struct SVGPathData {
	var commands:[String]//TODO: ⚠️️ this could be [Character] and Not [String] r even [CommandType] <-- command type is an enum
	var parameters:[CGFloat]
	init(_ commands:[String],_ parameters:[CGFloat]) {
		self.commands = commands
		self.parameters = parameters
	}
}

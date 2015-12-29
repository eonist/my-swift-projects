import Foundation
/*
 * this class serves as a data holder of SVGPath data, other SVGPath types extends this class to get access to its methods
 */
class SVGPathData {
	var commands:Array<Int>
	var parameters:Array<CGFloat>
	init(_ commands:Array<Int>,_ parameters:Array<CGFloat>) {
		self.commands = commands
		self.parameters = parameters
	}
}
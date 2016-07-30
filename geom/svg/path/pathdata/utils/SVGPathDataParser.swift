import Foundation

class SVGPathDataParser {
	/**
	 * Returns the pathData variables corrresponding to command index in @param index
	 * @param index the index of the command
	 * @Note this only returns the pathData corresponding to index until index + 1 (and retuns thr entire path data at that one index)
	 * // :TODO: rename to pathDataAt?
	 */
	class func pathData(path:SVGPath, _ index:Int)->Array<CGFloat> {
		let pathDataIndex:Int = SVGPathDataParser.index(path.commands, index);
		let commandLength:Int = SVGCommandParser.commandLength(path.commands[index]);
		return path.parameters.slice2(pathDataIndex,pathDataIndex+commandLength);//slice does not modify the original array, the slice method was recently changed to slice2
	}
	/**
	 * Returns the pathDataIndex based on the @param commandIndex
	 * @Note: traverses the entire pathData array until it hits the commandIndex, while it counts each pathData integer it traverses. This count is then returned
	 */
	class func index(commands:Array<String>,_ commandIndex:Int)->Int {
		var pathDataIndex:Int = 0;
		for (var i : Int = 0; i < commandIndex; i++) { pathDataIndex += SVGCommandParser.commandLength(commands[i]) };
		return pathDataIndex;
	}
}
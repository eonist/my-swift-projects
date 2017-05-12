import Foundation

class SVGPathDataParser {
	/**
	 * Returns the pathData variables corrresponding to command index in PARAM: index
	 * PARAM: index the index of the command
	 * NOTE: this only returns the pathData corresponding to index until index + 1 (and retuns thr entire path data at that one index)
	 * TODO: rename to pathDataAt?
	 */
	static func pathData(_ path:SVGPath, _ index:Int)->[CGFloat] {
		let pathDataIndex:Int = SVGPathDataParser.index(path.commands, index)
		let commandLength:Int = SVGCommandParser.commandLength(path.commands[index])
		return path.parameters.slice2(pathDataIndex,pathDataIndex+commandLength)//slice does not modify the original array, the slice method was recently changed to slice2
	}
	/**
	 * Returns the pathDataIndex based on the PARAM: commandIndex
	 * NOTE: traverses the entire pathData array until it hits the commandIndex, while it counts each pathData integer it traverses. This count is then returned
	 */
	static func index(_ commands:[String],_ commandIndex:Int)->Int {
        return commands.reduce(0){ index,command in
            index + SVGCommandParser.commandLength(command)
        }
	}
}

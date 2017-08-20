import Foundation

class SVGCommandParser {
	/**
	 * Returns the number of parameters for a specific command type
	 * TODO: ⚠️️ include GraphicsPathCommand.CUBIC_CURVE_TO when that is due for implimentation
	 * TODO: ⚠️️ isnt this function superflousouse since you can just trace the actual command and get the same value?
	 */
    static func commandLength(_ command:String)->Int {
        let command = command.lowercased()
        /*if(command == GraphicsPathCommand.NO_OP) return 0;*/
        if command == "c" {return 4}
        else if command == "a" {return 7}
        else{return 2}/*MOVE_TO, LINE_TO, WIDE_MOVE_TO, WIDE_LINE_TO are all 2 commands long*/
	 }
}

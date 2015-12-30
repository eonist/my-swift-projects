import Foundation
/*
 * variouse methods conserningpathdata both traversing over SVGPath data and svg XML syntax based data
 */
class SVGPathParser {
	/**
	 * Returns an SVGPathData instance from @param data (which is derived directly from the SVG XML formated data
	 * @param data ( M-60-45 L   25.00px,20)
	 * @example SVGPathDataUtils.pathData("M10,10pxH110");//commands: M,H parameters: 10,10,110
	 */
	class func pathData(data:String)->SVGPathData {
		var parameters:Array<CGFloat> = [];
		var commands:Array<String> = [];
		let pattern:String = "[MmLlHhVvCcSsQqTtZzAa])([\\d\\.\\-\\s\\,px]*?)(?=[MmLlHhVvCcSsQqTtZzAa]|$)"//Capturing groups: ?P<cmnd>,?P<params>
        let matches = data.matches(pattern)
        for match:NSTextCheckingResult in matches {/*Loops through the pattern*/
            match.numberOfRanges
            //let content = (data as NSString).substringWithRange(match.rangeAtIndex(0))//the entire match
            let cmnd = (data as NSString).substringWithRange(match.rangeAtIndex(1))//capturing group 1
            //Swift.print("cmnd: >" + cmnd+"<");
            commands.append(cmnd);//command()
            let params = (data as NSString).substringWithRange(match.rangeAtIndex(2))//capturing group 2
            //Swift.print("params: >" + params+"<");
            let array:Array<CGFloat> = SVGPathParser.parameters(params);
            //Swift.print("pathData.parameters: " + array);
            parameters += array//<---this is the same as concat
        }
        
//		Swift.print("pathData.commands: " + commands);
//		Swift.print("pathData.parameters: " + parameters);
		return SVGPathData(commands,parameters);
	}
    /**
	 * Returns an array comprised of values "sans" its prefix and or suffix
	 * // :TODO: write some examples in this comment section
	 * @Note cant make this private since polyline and polygon uses this method
	 */
	class func parameters(parameters:String)->Array<CGFloat> {
        let pattern:String = "(?<=^|\\,|\\s|px|\\b)\\-?\\d*?(\\.?)((?1)\\d+?)(?=px|\\s|\\,|\\-|$)"
		let stringArray:Array<String> = parameters.match(pattern);
        let array:Array<CGFloat> = stringArray.map {CGFloat(Double($0)!)}//<--temp fix
        return array
	}
	/**
	 * Returns the destination end position of a given command at @param commandIndex in @param commands
	 * @param index the index of the command
	 */
	class func end(path:SVGPath, index:Int)->CGPoint {// :TODO: rename to position?!?
		var command:String = (path.commands[index] as String).toLowerCase();
		var parameters:Array = SVGPathDataParser.pathData(path, index);
		if(command == "m" || command == "l") return new Point(parameters[0],parameters[1]);
		else if(command == "c") return new Point(parameters[2],parameters[3]);
		else return null;//Arc4Parser.end(PathDataParser.arc(pathData));/*PathCommand.ARC_TO*/
	}
}

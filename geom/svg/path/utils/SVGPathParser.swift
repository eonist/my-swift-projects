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
		var pattern:String = "[MmLlHhVvCcSsQqTtZzAa])([\\d\\.\\-\\s\\,px]*?)(?=[MmLlHhVvCcSsQqTtZzAa]|$)"//Capturing groups: ?P<cmnd>,?P<params>
        let matches = data.matches(pattern)
        for match:NSTextCheckingResult in matches {/*Loops through the pattern*/
            match.numberOfRanges
            let content = (data as NSString).substringWithRange(match.rangeAtIndex(0))//the entire match
            let cmnd = (data as NSString).substringWithRange(match.rangeAtIndex(1))//capturing group 1
            //Swift.print("cmnd: >" + cmnd+"<");
            commands.append(cmnd);//command()
            let params = (data as NSString).substringWithRange(match.rangeAtIndex(2))//capturing group 2
            //Swift.print("params: >" + params+"<");
            var array:Array<CGFloat> = SVGPathParser.parameters(params);
            //Swift.print("pathData.parameters: " + array);
            parameters = parameters.concat(array);
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
	public static function parameters(parameters:String):Array {
		return parameters.match(/(?<=^|\,|\s|px|\b)\-?\d*?(\.?)((?1)\d+?)(?=px|\s|\,|\-|$)/g);
	}
}

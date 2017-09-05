import Foundation
/*
 * variouse methods conserningpathdata both traversing over SVGPath data and svg XML syntax based data
 */
class SVGPathParser {
    private static let paramStartPattern:String = "(?<=^|\\,|\\s|px|\\b|\\d)"
    private static let paramEndPattern:String = "(?=px|\\s|\\,|\\-|$)"
    private static let pathPattern:String = "([MmLlHhVvCcSsQqTtZzAa])([\\d\\.\\-\\s\\,px]*?)(?=[MmLlHhVvCcSsQqTtZzAa]|$)"///(?P<cmnd>[MmLlHhVvCcSsQqTtZzAa])(?P<params>[\d\.\-\s\,px]*?)(?=[MmLlHhVvCcSsQqTtZzAa]|$)/g;
    /**
     * Returns an SVGPathData instance from PARAM: data (which is derived directly from the SVG XML formated data
     * PARAM: data ( M-60-45 L   25.00px,20)
     * EXAMPLE: SVGPathDataUtils.pathData("M10,10pxH110");//commands: M,H parameters: 10,10,110
     */
    static func pathData(_ data:String)->SVGPathData {
        let matches = data.matches(pathPattern)
        return matches.reduce(SVGPathData([],[])) {pathData,match in /*Loops through the pattern*///TODO: use marches.forEach instead
            var pathData = pathData
            let cmnd = match.value(data,1)/*Capturing group 1*/
            pathData.commands.append(cmnd)
            let params = match.value(data,2)/*Capturing group 2*/
            let array:[CGFloat] = SVGPathParser.parameters(params)
            pathData.parameters += array//<---this is the same as concat
            return pathData
        }
    }
    /**
     * Returns an array comprised of values "sans" its prefix and or suffix
     * NOTE: cant make this private since polyline and polygon uses this method
     * EXAMPLE: SVGPathParser.parameters("3.0-185.12-89.2")//[3.0, -185.12, -89.2]
     * EXAMPLE: SVGPathParser.parameters("-75,53.571-147.029,36.822-185-89.748")//[-75.0, 53.571, -147.029, 36.822, -185.0, -89.748]
     * TODO: ⚠️️ Write more examples in this comment section
     */
    static func parameters(_ parameters:String)->[CGFloat] {
        let middle:String = RegExpPattern.digitAssertPattern
        let pattern:String = paramStartPattern + middle + paramEndPattern
        let stringArray:[String] = parameters.match(pattern)
        return stringArray.map {$0.cgFloat}//<--temp fix, converts the values in the array to CGFloat
    }
    /**
     * Returns the destination end position of a given command at PARAM: commandIndex in PARAM: commands
     * PARAM: index the index of the command
     */
    static func end(_ path:SVGPath, _ index:Int)->CGPoint? {// :TODO: rename to position?!?
        let command:String = path.commands[index].lowercased()
        let parameters:[CGFloat] = SVGPathDataParser.pathData(path, index)
        if command == "m" || command == "l" {return CGPoint(parameters[0],parameters[1])}
        else if command == "c" {return CGPoint(parameters[2],parameters[3])}
        else { return nil}//Arc4Parser.end(PathDataParser.arc(pathData));/*PathCommand.ARC_TO*/
    }
    /**
     * Returns all points in PARAM: path
     * TODO: ⚠️️ Impliment native quad to
     * TODO: ⚠️️ Add support for zZ ?!? do we need to?
     * TODO: ⚠️️ Cubic and quad curve may have more params and they may have t and s  impliment this
     */
    static func points(_ path:SVGPath)->[CGPoint] {
        var commands:[String] = path.commands
        var params:[CGFloat] = path.parameters
        var positions:[CGPoint] = []
        var i:Int = 0/*parameterIndex*/
        var prevP:CGPoint = CGPoint()
        (0..<commands.count).indices.forEach { e in
            let command:String = commands[e]
            let isLowerCase:Bool = StringAsserter.lowerCase(command)
            var pos:CGPoint = isLowerCase ? prevP.copy() : CGPoint()
            switch SVGPathCommand(rawValue:Character(command.lowercased())) {
                case .m?, .l?: /*lineTo,moveTo*/
                    pos += CGPoint(params[i+0],params[i+1])
                    i += 2
                    break;
                case .h?:/*horizontalLineTo*/
                    pos += CGPoint(params[i],isLowerCase ? 0 : prevP.y)
                    i += 1
                    break;
                case .v?:/*verticalLineTo*/
                    pos += CGPoint(isLowerCase ? 0 : prevP.x,params[i])
                    i += 1
                    break;
                case .c?:/*cubicCurveTo*/ // :TODO: this hasn't been tested!!
                    pos += CGPoint(params[i+4],params[i+5])
                    i += 6
                    break;
                case .s?:/*smooth Cubic curve command*/
                    pos += CGPoint(params[i+2],params[i+3])
                    i += 4
                    break;
                case .q?:/*quadCurveTo*/
                    pos += CGPoint(params[i+2],params[i+3])
                    i += 4
                    break;
                case .t?:/*smooth quadratic curve command*/
                    pos += CGPoint(params[i],params[i+1])
                    i += 2
                    break;
                default:break;
            }
            positions.append(pos)
            if e < commands.count-1 {
                prevP = pos.copy()
            }
        }
        return positions
    }
    /**
     * Returns an Rectangle instance with points derived from PARAM: path
     * TODO: arcs and curve bounding boxes will be dificult,but you have code for this, see notebooks
     */
    static func rectangle(_ path:SVGPath) -> CGRect {
        let points:[CGPoint] = SVGPathParser.points(path)
        return CGPointParser.rectangle(points)
    }
}

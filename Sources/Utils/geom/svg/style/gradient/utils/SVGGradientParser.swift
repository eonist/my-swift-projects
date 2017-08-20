import Foundation
/**
 * This class has methods that converts xml data into SVGGradient instances
 */
class SVGGradientParser {
    static var gradientTransformPattern:String = "(?<=^matrix\\().+?(?=\\)$)"
	/**
	 * Returns an gradient instance with data derived from PARAM: xml 
	 * PARAM: xml (<linearGradient id="skyline"><stop offset="0" style="stop-color:blue"/><stop offset="1" style="stop-color:red"/></linearGradient>)
	 * other attributes: gradientTransform,gradientUnits,xlink:href
     * TODO: To support % values for x1,y1,x2,y2  you will need to set said values to :Any and then use FLoat and CGFloat to differenciate between the two different schemes. Then use this scheme to toggle between the two usecases: example: <linearGradient id="linear" x1="0%" y1="0%" x2="100%" y2="0%">
	 */
	static func linearGradient(_ xml:XML)->SVGLinearGradient{
		let x1Str:String = SVGPropertyParser.property(xml,"x1")!
		let x1:CGFloat = StringAsserter.percentage(x1Str) ? StringParser.percentage(x1Str) : SVGPropertyParser.value(x1Str)
		let y1Str:String = SVGPropertyParser.property(xml,"y1")!
		let y1:CGFloat = StringAsserter.percentage(y1Str) ? StringParser.percentage(y1Str) : SVGPropertyParser.value(y1Str)
		let x2Str:String = SVGPropertyParser.property(xml,"x2")!
		let x2:CGFloat = StringAsserter.percentage(x2Str) ? StringParser.percentage(x2Str) : SVGPropertyParser.value(x2Str)
		let y2Str:String = SVGPropertyParser.property(xml,"y2")!
		let y2:CGFloat = StringAsserter.percentage(y2Str) ? StringParser.percentage(y2Str) : SVGPropertyParser.value(y2Str)
		let svgGradient:SVGGradient = Utils.gradient(xml)
		return SVGLinearGradient(svgGradient.offsets,svgGradient.colors,x1,y1,x2,y2,svgGradient.gradientUnits,svgGradient.spreadMethod,svgGradient.id,svgGradient.gradientTransform)
	}
	/**
	 * Returns an gradient instance with data derived from PARAM: xml 
	 */
	static func radialGradient(_ xml:XML)->SVGRadialGradient{
		let cxStr:String = SVGPropertyParser.property(xml,"cx")!
        let cx:CGFloat = StringAsserter.percentage(cxStr) ? StringParser.percentage(cxStr) : SVGPropertyParser.value(cxStr)
		let cyStr:String = SVGPropertyParser.property(xml,"cy")!
		let cy:CGFloat = StringAsserter.percentage(cyStr) ? StringParser.percentage(cyStr) : SVGPropertyParser.value(cyStr)
		let rStr:String = SVGPropertyParser.property(xml,"r")!
		let r:CGFloat = StringAsserter.percentage(rStr) ? StringParser.percentage(rStr) : SVGPropertyParser.value(rStr)
        let fxStr:String? = SVGPropertyParser.property(xml,"fx")
        let fx:CGFloat = fxStr != nil && StringAsserter.percentage(fxStr!) ? StringParser.percentage(fxStr!) : SVGPropertyParser.value(fxStr)
		let fyStr:String? = SVGPropertyParser.property(xml,"fy")
        let fy:CGFloat = fyStr != nil && StringAsserter.percentage(fyStr!) ? StringParser.percentage(fyStr!) : SVGPropertyParser.value(fyStr)
		let svgGradient:SVGGradient = Utils.gradient(xml)
		return SVGRadialGradient(svgGradient.offsets,svgGradient.colors,svgGradient.gradientUnits,svgGradient.spreadMethod,svgGradient.id,cx,cy,r,fx,fy,svgGradient.gradientTransform)
	}
}
private class Utils{
	/**
	 * Returns an gradient instance with data derived from PARAM: xml 
     * TODO: If the offset value is: 4.566173e-02, the percentage parser won't understand it. Add support for this?
     * TODO: possibly itterate the offset if its null (see Element framework on how to do this)
     * TODO: if style is present then dont check for color etc
	 */
	static func gradient(_ xml:XML)->SVGGradient{
        let spreadMethod:String = SVGPropertyParser.property(xml,"spreadMethod") ?? ""/*<--temp*/
        let id:String = SVGPropertyParser.id(xml)
        let gradientTransform:CGAffineTransform? = Utils.gradientTransform(xml)
        let gradientUnits:String = SVGPropertyParser.property(xml,"gradientUnits")!
        let offsetsAndColors:(offsets:[CGFloat],colors:[CGColor]) = xml.children!.reduce((offsets:[],colors:[])) { result,childNode in //(offsets:[],colors:[])
            guard let child:XML = childNode as? XML else{fatalError("error")}
            let offsetStr:String = SVGPropertyParser.property(child,"offset")!
            let offset:CGFloat = StringAsserter.digit(offsetStr) ? offsetStr.cgFloat : StringParser.percentage(offsetStr) / 100/*offset is number between 0-1 or offset is percentage %*/
			let hexColor:UInt
            var stopOpacity:CGFloat
			if let style = SVGPropertyParser.property(child,"style") {
				var inlineStyle:[String:String] = SVGStyleParser.inlineStyle(style)
                stopOpacity = SVGPropertyParser.value(inlineStyle["stop-opacity"])
                let stopColorProperty:String = inlineStyle["stop-color"]!
                hexColor = StringParser.color(stopColorProperty)
			} else{
                stopOpacity = SVGPropertyParser.value(SVGPropertyParser.property(child,"stop-opacity"))
				hexColor = StringParser.color(SVGPropertyParser.property(child,"stop-color")!)
			}
            if stopOpacity.isNaN {stopOpacity = 1}/*Forces stopOpacity to be 1 if its NaN*/
            let stopColor:CGColor = CGColor.cgColor(hexColor, stopOpacity)
            return (result.offsets + [offset], result.colors + [stopColor])
		}
        return SVGGradient(offsetsAndColors.offsets,offsetsAndColors.colors,spreadMethod,id,gradientUnits,gradientTransform)
	}
    /**
     * Returns an Matrix instance with GradientTransform data derived from PARAM: xml
     */
    static func gradientTransform(_ xml:XML)->CGAffineTransform? {
        if let gradientTransformString = SVGPropertyParser.property(xml,"gradientTransform"){
            let matrixString:String = gradientTransformString.match(SVGGradientParser.gradientTransformPattern)[0]
            let matrixStringArray:[String] = matrixString.split(" ")
            let matrixArr:[CGFloat] = matrixStringArray.map {$0.cgFloat}//<--Todo: use $0.cgFloat here
            return CGAffineTransform(matrixArr[0],matrixArr[1],matrixArr[2],matrixArr[3],matrixArr[4],matrixArr[5])//Swift 3 was->CGAffineTransformMake
        }
        return nil
    }
}

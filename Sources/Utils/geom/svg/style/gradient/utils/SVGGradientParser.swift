import Foundation
/**
 * This class has methods that converts xml data into SVGGradient instances
 */
class SVGGradientParser {
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
	 */
	static func gradient(_ xml:XML)->SVGGradient{
        
        /*userSpaceOnUse*/
        let spreadMethod:String = SVGPropertyParser.property(xml,"spreadMethod") ?? ""/*<--temp*/
        let id:String = SVGPropertyParser.id(xml)
        //Swift.print("id: " + "\(id)")
        let gradientTransform:CGAffineTransform? = Utils.gradientTransform(xml)
        let gradientUnits:String = SVGPropertyParser.property(xml,"gradientUnits")!
        
        
        
		//var offsets:[CGFloat] = []
		//var colors:[CGColor] = []
		//var opacities:[CGFloat] = []
        let arrays:(offsets:[CGFloat],colors:[CGColor]) = xml.children?.reduce(([],[])){
            let child:XML = $1 as! XML
			let offsetStr:String = SVGPropertyParser.property(child,"offset")!
            let offset:CGFloat = StringAsserter.digit(offsetStr) ? CGFloat(Double(offsetStr)!) /** 255*/ : StringParser.percentage(offsetStr) / 100 /** 255*/;
			/*offset is number between 0-1 or offset is percentage %*/
			// :TODO: possibly itterate the offset if its null (see Element framework on how to do this)
			// Swift.print("offset: " + offset);
			let hexColor:UInt
            var stopOpacity:CGFloat
			//var stopOpacity:CGFloat
			/*0-1*/
			let style:String? = SVGPropertyParser.property(child,"style")
			// :TODO: if style is present then dont check for color etc
			if(style != nil){
				// Swift.print("style: " + style);
				var inlineStyle:[String:String] = SVGStyleParser.inlineStyle(style!)
//				ObjectParser.describe(inlineStyle);
				let stopColorProperty:String = inlineStyle["stop-color"]!
				// Swift.print("stopColorProperty: " + stopColorProperty);
                stopOpacity = SVGPropertyParser.value(inlineStyle["stop-opacity"])
                hexColor = StringParser.color(stopColorProperty)
				// Swift.print("stopOpacity: " + stopOpacity);
			} else{
                stopOpacity = SVGPropertyParser.value(SVGPropertyParser.property(child,"stop-opacity"))
				hexColor = StringParser.color(SVGPropertyParser.property(child,"stop-color")!)
			}
            if(stopOpacity.isNaN) {stopOpacity = 1}/*Forces stopOpacity to be 1 if its NaN*/
            let stopColor:CGColor = CGColor.cgColor(hexColor, stopOpacity)//Double();
            
            
            return ($0.0 + offset, $0.1 + stopColor)
			//opacities.append(stopOpacity)
		} ?? ([],[])
		
        //Swift.print("gradientUnits: " + "\(gradientUnits)")
		
        //Swift.print("SVGGradientParser.gradient() gradientTransform: " + "\(gradientTransform)")
		//return /**/
        
        return SVGGradient([],[],spreadMethod,id,gradientUnits,gradientTransform)
	}
    /**
     * Returns an Matrix instance with GradientTransform data derived from PARAM: xml
     */
    static func gradientTransform(_ xml:XMLElement)->CGAffineTransform? {
        var gradientTransform:CGAffineTransform? = nil
        let gradientTransformString:String? = SVGPropertyParser.property(xml,"gradientTransform")
        if(gradientTransformString != nil){
            let matrixString:String = gradientTransformString!.match("(?<=^matrix\\().+?(?=\\)$)")[0]
            let matrixStringArray:[String] = matrixString.split(" ")
            let matrixArray:[CGFloat] = matrixStringArray.map {CGFloat(Double($0)!)}//<--todo: use $0.cgFloat here
            gradientTransform = CGAffineTransform(matrixArray[0],matrixArray[1],matrixArray[2],matrixArray[3],matrixArray[4],matrixArray[5])//Swift 3 was->CGAffineTransformMake
        }
        return gradientTransform
    }
}

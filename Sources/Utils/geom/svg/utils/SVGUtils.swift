import Cocoa
/*
 * XML utility methods
 * NOTE: This class has methods that convert SVG elements into XML
 */
class SVGUtils {
	/**
	 * Returns svg syntax in an XML instance derived from PARAM: svg 
	 * PARAM: svg (instance of a custom SVG class that is easy to work with)
	 * NOTE: for the reverse function look into using the adobe native functionality namespaceDeclarations, namespace to also include the namespace
	 */
	static func xml(_ svg:SVG)->XML {// :TODO: refactor to one or loop?
		let xml:XML = SVGUtils.svg(svg)
		return svg.items.reduce(xml){
			let svgElement:SVGElementKind = $1
            let child:XML = {
                switch svgElement{
                case let svgLine as SVGLine:return line(svgLine)
                case let svgRect as SVGRect:return rect(svgRect)
                case let svgPath as SVGPath:return path(svgPath)
                case let svgGroup as SVGGroup:return group(svgGroup)
                default:fatalError("type not supported: " + "\(svgElement)")
                }
            }()
            $0.appendChild(child)
            return $0
		}
	}
	/**
	 * Returns pathData from PARAM: path (SVGPath instance)
     * TODO: ⚠️️ It could be faster to use Character array to test with instead of RegEx
	 */
    static func pathData(_ path:SVGPath)->String {
        let cmds:[String] = path.commands
        let params:[CGFloat] = path.parameters
        var i:Int = 0
        return cmds.reduce(""){ res,cmd in
            let index = i
            switch true{
                case cmd.test("[m,M,l,L,t,T]"):
                    i += 2
                    return res + cmd + params[index].string + " " + params[index + 1].string + " "
                case cmd.test("[h,H,v,V]"):
                    i += 1
                    return res + cmd + params[index].string + " "
                case cmd.test("[s,S,q,Q]"):
                    i += 1
                    return res + cmd + params[index].string + " " + params[index+1].string + " " + params[index+2].string + " " + params[index+3].string + " "
                case cmd.test("[c,C]"):
                    i += 1
                    return res + cmd + params[index].string + " " + params[index+1].string + " " + params[index+2].string + " " + params[index+3].string + " " + params[index+4].string + " " + params[index+5].string + " "
                case cmd.test("[a,A]"):
                    i += 1
                    return res + cmd + params[index].string + " " + params[index+1].string + " " + params[index+2].string + " " + params[index+3].string + " " + params[index+4].string + " " + params[index+5].string + " " + params[index+6].string + " "
                case cmd.test("[z,Z]"):
                    i += 1
                    return res + cmd + " "
                default:
                    fatalError("command not supported: \(cmd)")
            }
        }.replace("\\s*?$", "")/*Removes the ending whitespace, if it exists*/
    }
	/**
	 * Returns the root node for the SVG XML document
	 */
	static func svg(_ svg:SVG)->XML {
		let xml:XML = "<?xml version=“1.0”?><svg></svg>".xml
		xml["xmlns"] = "http://www.w3.org/2000/svg"
		xml["x"] = svg.frame.x.string+"px"
		xml["y"] = svg.frame.y.string+"px"
		xml["width"] = svg.width.string + "px"
		xml["height"] = svg.height.string + "px"
		return xml
	}
	/**
	 * Returns a svg line in SVG XML notation from PARAM: line (SVGLine)
	 */
	static func line(_ line:SVGLine)->XML {
		var xml:XML = "<line></line>".xml
		xml = id(xml,line);
		xml["x1"] = line.x1.string
		xml["y1"] = line.y1.string
		xml["x2"] = line.x2.string
		xml["y2"] = line.y2.string
		xml = style(xml,line)
		return xml
	}
	/**
	 * Returns a svg rect in SVG XML notation from PARAM: rect (SVGRect)
	 */
	 static func rect(_ rect:SVGRect)->XML {//NOTE:: API<rect x="64" y="64" fill="none" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
		var xml:XML = "<rect></rect>".xml
		xml = id(xml,rect);
		xml["x"] = rect.frame.x.string
		xml["y"] = rect.frame.y.string
		xml["width"] = rect.rect.w.string
		xml["height"] = rect.rect.h.string
		xml = style(xml,rect)
		xml["stroke-miterlimit"] = rect.style!.strokeMiterLimit!.string
		return xml
	 }
	 /**
	  * Returns an SVGPath instance in SVG XML notation from PARAM: path (SVGPath)
	  */
	 static func path(_ path:SVGPath)->XML {
         var xml:XML = "<path></path>".xml
		 xml = id(xml,path)
		 xml["d"] = SVGUtils.pathData(path)
		 xml = style(xml,path)
		 return xml
	 }
	 /**
	  * Returns an XML instance with SVGGroup data derived from PARAM: group
	  * NOTE: this method is recursive
	  * TODO: ⚠️️ Remember groups can have style applied inline cant they? xml = style(xml,group); not supported yet
	  */
	 static func group(_ group:SVGGroup) -> XML {
        let xml:XML = id("<g></g>".xml,group)
        return group.items.reduce(xml){ result,svgGraphic in
            let child:XML = {
                switch svgGraphic{
                    case let svgGraphic as SVGLine:return line(svgGraphic)
                    case let svgGraphic as SVGRect:return rect(svgGraphic)
                    case let svgGraphic as SVGPath:return path(svgGraphic)
                    case let svgGraphic as SVGGroup:return SVGUtils.group(svgGraphic)
                    default:fatalError("type not supported: " + "\(svgGraphic)")
                }
            }()
            xml.appendChild(child)
            return result
		 }
	 }
	 /**
	  * Returns the id from a ISVG instance
	  * TODO: move to an internal class
	  */
	 static func id(_ xml:XMLElement,_ svg:SVGElementKind)->XML {
         if(svg.id != "") {xml["id"] = svg.id}
		 return xml
	 }
	 /**
	  * Returns an XML instance with style properties derived from PARAM: xml
	  * TODO: move to an internal class
      * TODO: ⚠️️ this method is missing support for gradient (Get clues from the legacy SVGPropertyParser)
      * TODO: ⚠️️ More refactoring with guard and if let
      * TODO: add support for fillOpacity,fillRule,strokeOpacity,strokeLineCap,strokeLineJoin,strokeMiterLimit, (Get ques from the old SVGPropertyParser)
	  */
	 static func style(_ xml:XMLElement,_ graphic:SVGGraphic)->XML {
         xml["fill"] = graphic.style!.fill is Double && !((graphic.style!.fill as! Double).isNaN) ? "#"+HexParser.hexString((graphic.style!.fill as! Double).uint):"none"
		 xml["stroke"] = graphic.style!.stroke is Double && !(graphic.style!.stroke as! Double).isNaN ? "#"+HexParser.hexString((graphic.style!.stroke as! Double).uint):"none"
         if(graphic.style!.strokeWidth != nil && !graphic.style!.strokeWidth!.isNaN && graphic.style!.strokeWidth! != 1) {xml["stroke-width"] = "\(graphic.style!.strokeWidth!)"}/*if strokeWidth is 1 then you dont have to include it in the svg, this is considered a default value if stroke is avialbale*/
		 return xml
	 }
}

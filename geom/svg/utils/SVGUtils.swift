import Foundation
/*
 * XML utility methods (Beta)
 * @Note: This class has methods that conver SVG elements into XML
 */
class SVGUtils {
	/**
	 * Returns svg syntax in an XML instance derived from @param svg 
	 * @param svg (isntance of a custom SVG class that is easy to work with)
	 * @Note for the reverse function look into using the adobe native functionality namespaceDeclarations, namespace to also include the namespace
	 */
	class func xml(svg:SVG)->NSXMLElement {// :TODO: refactor to one or loop?
		var xml:NSXMLElement = SVGUtils.svg(svg);
		for (var i : Int = 0; i < svg.items.count; i++) {
			var svgElement:ISVGElement = svg.items[i];
			var child:NSXMLElement;
            if(svgElement is SVGLine) {child = line(svgElement as! SVGLine)}
            else if(svgElement is SVGRect) {child = rect(svgElement as! SVGRect)}
            else if(svgElement is SVGPath) {child = path(svgElement as! SVGPath)}
            else if(svgElement is SVGGroup) {child = group(svgElement as! SVGGroup)}
			xml.appendChild(child);
		}
		return xml;
	}
	/**
	 * Returns pathData from @param path (SVGPath instance)
	 */
	class func pathData(path:SVGPath)->String {
		var pathData:String = ""
		let commands:Array<String> = path.commands
		var parameters:Array<CGFloat> = path.parameters;
		var index:Int = 0;
		for command : String in commands {
			if(command.test("[m,M,l,L,t,T]")) {
				pathData += command + String(parameters[index]) + " " + String(parameters[index + 1]) + " "
				index += 2
			}else if(command.test("[h,H,v,V]")){
				pathData += command + String(parameters[index]) + " "
				index++
			}else if(command.test("[s,S,q,Q]")){
				pathData += command + String(parameters[index]) + " " + String(parameters[index+1]) + " " + String(parameters[index+2]) + " " + String(parameters[index+3]) + " "
				index++;
			}else if(command.test("[c,C]")){
				pathData += command + String(parameters[index]) + " " + String(parameters[index+1]) + " " + String(parameters[index+2]) + " " + String(parameters[index+3]) + " " + String(parameters[index+4]) + " " + String(parameters[index+5]) + " ";
				index++;
			}else if(command.test("[a,A]")){
				pathData += command + String(parameters[index]) + " " + String(parameters[index+1]) + " " + String(parameters[index+2]) + " " + String(parameters[index+3]) + " " + String(parameters[index+4]) + " " + String(parameters[index+5]) + " " + String(parameters[index+6]) + " ";
				index++;
			}else if(command.test("[z,Z]")){
				pathData += command + " ";
				index++;
			}
		}
		pathData = pathData.replace("\\s*?$", "")/*Removes the ending whitespace, if it exists*/
		return pathData;	
	}
	/**
	 * Returns the root node for the SVG XML document
	 */
	class func svg(svg:SVG)->NSXMLElement {
		let xml:NSXMLElement = try! NSXMLElement(XMLString: "<?xml version=“1.0”?><svg></svg>")
		xml["xmlns"] = "http://www.w3.org/2000/svg";
		xml["x"] = String(svg.x)+"px";
		xml["y"] = String(svg.y)+"px";
		xml["width"] = String(svg.width)+"px";
		xml["height"] = String(svg.height)+"px";
		return xml;
	}
	/**
	 * Returns a svg line in SVG XML notation from @param line (SVGLine)
	 */
	class func line(line:SVGLine)->NSXMLElement {
		var xml:NSXMLElement = try! NSXMLElement(XMLString: "<line></line>")
		xml = id(xml,line);
		xml["x1"] = "\(line.x1)";
		xml["y1"] = "\(line.y1)";
		xml["x2"] = "\(line.x2)";
		xml["y2"] = "\(line.y2)";
		xml = style(xml,line);
		return xml;
	}
}
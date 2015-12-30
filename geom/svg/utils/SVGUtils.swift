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
		var pathData:String = "";
		var commands:Array<String> = path.commands; 
		var parameters:Array = path.parameters;
		var index:int = 0;
		for each (var command : String in commands) {
			if(new RegExp("[m,M,l,L,t,T]").test(command)) {
				pathData += command + parameters[index] + " " + parameters[index+1] + " ";
				index+=2;
			}else if(new RegExp("[h,H,v,V]").test(command)){
				pathData += command + parameters[index] + " ";
				index++;
			}else if(new RegExp("[s,S,q,Q]").test(command)){
				pathData += command + parameters[index] + " " + parameters[index+1] + " " + parameters[index+2] + " " + parameters[index+3] + " ";
				index++;
			}else if(new RegExp("[c,C]").test(command)){
				pathData += command + parameters[index] + " " + parameters[index+1] + " " + parameters[index+2] + " " + parameters[index+3] + " " + parameters[index+4] + " " + parameters[index+5] + " ";
				index++;
			}else if(new RegExp("[a,A]").test(command)){
				pathData += command + parameters[index] + " " + parameters[index+1] + " " + parameters[index+2] + " " + parameters[index+3] + " " + parameters[index+4] + " " + parameters[index+5] + " " + parameters[index+6] + " ";
				index++;
			}else if(new RegExp("[z,Z]").test(command)){
				pathData += command + " ";
				index++;
			}
		}
		pathData = pathData.replace(/\s*?$/, "");/*Removes the ending whitespace, if it exists*/
		return pathData;	
	}
}
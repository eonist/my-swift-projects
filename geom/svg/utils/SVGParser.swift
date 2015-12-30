import Foundation
/**
 * // :TODO: impliment text (<text x="60" y="165" style="font-family: sans-serif; font-size: 14pt; stroke: none; fill: black;">Cat</text>)
 */
class SVGParser {
    /**
     * Returns an SVGDoc instance derived from @param xml
     * @Note the regular expression removes the PX suffix
     */
    class func svg(xml:NSXMLElement)->SVG {
        var x:CGFloat = SVGPropertyParser.digit(xml,"x");
        var y:CGFloat = SVGPropertyParser.digit(xml,"y");
        var width:CGFloat = SVGPropertyParser.digit(xml,"width");
        var height:CGFloat = SVGPropertyParser.digit(xml,"height");
        var version:CGFloat = SVGPropertyParser.value(SVGPropertyParser.property(xml, "version"));
        var nameSpace:String = ""//xml.namespaceDeclarations().toString();//TODO: implement this later
        var id:String = SVGPropertyParser.id(xml);
        var doc:SVG = SVG([],x,y,width,height,version,nameSpace,id);
        let children:NSArray = xml.children!
        let count = children.count//or use rootElement.childCount TODO: test this
        for (var i = 0; i < count; i++) {
            let child:NSXMLElement = XMLParser.childAt(children, i)!
            doc.add(element(child,doc))//print("Import - child.toXMLString(): " + child.toXMLString());
        }
        return doc;
    }
    /**
     * Returns An ISVG instance or SVGLinearGradient instance (For now, in the future other types will be added)
     * @Note: SVGParser.group uses this method to create elements from xml, and adds the group style to its decendants
     * // :TODO: Not sure what the purpose of this method is
     * // :TODO: add Radial gradient support
     * // :TODO: impliment title and desc elements see svg pdf <title>Grouped Drawing</title>   and   <desc>Stick-figure drawings of a house and people</desc>
     */
    class func element(xml:XML,container:ISVGContainer)->ISVGElement {
        var element:ISVGElement;
        var style:SVGStyle = SVGPropertyParser.style(xml,container);
        if(container is SVGGroup && SVGGroup(container).style != null) SVGStyleModifier.merge(style, SVGGroup(container).style);/*parent style is inherited down to sub elements*/
        var id:String = SVGPropertyParser.id(xml);
        switch(xml.localName()){
            case SVGConstants.RECT: element = rect(xml,style,id); break;
            case SVGConstants.POLY_LINE: element =  polyLine(xml,style,id); break;
            case SVGConstants.POLYGON: element = polygon(xml,style,id); break;
            case SVGConstants.PATH: element = path(xml,style,id); break;
            case SVGConstants.LINE: element = line(xml,style,id); break;
            case SVGConstants.CIRCLE: element = circle(xml,style,id); break;
            case SVGConstants.ELLIPSE: element = ellipse(xml,style,id); break;
            case SVGConstants.GROUP: element = group(xml,style,id); break;
            case SVGConstants.LINEAR_GRADIENT: element = SVGGradientParser.linearGradient(xml); break;
            case SVGConstants.RADIAL_GRADIENT: element = SVGGradientParser.radialGradient(xml); break;
        }
        return element;
    }
}

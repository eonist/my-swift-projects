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
        let x:CGFloat = SVGPropertyParser.digit(xml,"x");
        let y:CGFloat = SVGPropertyParser.digit(xml,"y");
        let width:CGFloat = SVGPropertyParser.digit(xml,"width");
        let height:CGFloat = SVGPropertyParser.digit(xml,"height");
        let version:CGFloat = SVGPropertyParser.value(SVGPropertyParser.property(xml, "version"));
        let nameSpace:String = ""//xml.namespaceDeclarations().toString();//TODO: implement this later
        let id:String = SVGPropertyParser.id(xml);
        let doc:SVG = SVG([],x,y,width,height,version,nameSpace,id);
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
    class func element(xml:NSXMLElement,_ container:ISVGContainer)->ISVGElement {
        var element:ISVGElement;
        var style:SVGStyle = SVGPropertyParser.style(xml, container)
        if(container is SVGGroup && (container as! SVGGroup).style != nil) {SVGStyleModifier.merge(style, (container as! SVGGroup).style!)}/*parent style is inherited down to sub elements*/
        var id:String = SVGPropertyParser.id(xml);
        switch(xml.localName!){
            case SVGConstants.rect: element = rect(xml,style,id); break;
            case SVGConstants.polyLine: element =  polyLine(xml,style,id); break;
            case SVGConstants.polygon: element = polygon(xml,style,id); break;
            case SVGConstants.path: element = path(xml,style,id); break;
            case SVGConstants.line: element = line(xml,style,id); break;
            case SVGConstants.circle: element = circle(xml,style,id); break;
            case SVGConstants.ellipse: element = ellipse(xml,style,id); break;
            case SVGConstants.group: element = group(xml,style,id); break;
            case SVGConstants.linearGradient: element = SVGGradientParser.linearGradient(xml); break;
            case SVGConstants.radialGradient: element = SVGGradientParser.radialGradient(xml); break;
            default: break;
        }
        return element;
    }
    /**
     * Returns a Group instance comprised of svg elements derived from @param xml
     * @param xml (<g id="whiskers"></g>)
     * // :TODO: impliment support for Desc and title elements to be added to group <desc>House with door</desc>
     */
    class func group(xml:NSXMLElement, _ style:SVGStyle, _ id:String) -> SVGGroup {
        let group:SVGGroup = SVGGroup([],style,id);
        for (var i = 0; i < xml.childCount; i++) {
            let child:NSXMLElement = XMLParser.childAt(xml.children!, i)!
            group.add(element(child,group))
        }
        return group;
    }
    /**
     * Returns an SVGPath element derived from the path data in @param xml with the @param style and @param id
     * @example <path d="M 10 10, L 40 10, L 40 30, L 10 30, L 10 10" />//rectangle; all four lines
     * @example <path d="M 60 10, L 90 10, L 90 30, L 60 30, Z" /> //rectangle with closepath
     * @example <path d="M 30 30 L 55 5 L 80 30 L 55 55 Z" />
     * @example <path d="M 12 24 h 15 v 25 h -15 z"/> //
     * // :TODO: remember to differentiate between Uppercase and lower case
     */
    class func path(xml:NSXMLElement,style:SVGStyle,id:String)->SVGPath? {
        if(!xml.hasAttribute(SVGConstants.data)) {return nil}
        var pathDefinition:String = xml[String(SVGConstants.data)]!
//			print("pathDefinition: " + pathDefinition);
        var svgPathData:SVGPathData = SVGPathParser.pathData(pathDefinition);//[PathCommand.MOVE_TO,PathCommand.CURVE_TO], [0,0,100,0,200,200]
        return SVGPath(svgPathData.commands,svgPathData.parameters,style,id);
    }
    /**
     * Returns an SVGRect element derived from the rectangle data in @param xml with the @param style and @param id
     */
    class func rect(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGRect {
        let x:CGFloat = SVGPropertyParser.digit(xml,"x");
        let y:CGFloat = SVGPropertyParser.digit(xml,"y");
        let width:CGFloat = SVGPropertyParser.digit(xml,"width");
        let height:CGFloat = SVGPropertyParser.digit(xml,"height");
        let rx:CGFloat = SVGPropertyParser.digit(xml,"rx");
        let ry:CGFloat = SVGPropertyParser.digit(xml,"ry");
        return SVGRect(width, height, x, y, rx, ry, style, id);
    }
    /**
     * Returns an SVGLine element derived from the line data in @param xml with the @param style and @param id
     */
    class func line(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGLine {
        // :TODO: should return nil if there is no def ?!?
        let x1:CGFloat = SVGPropertyParser.digit(xml,"x1");
        let y1:CGFloat = SVGPropertyParser.digit(xml,"y1");
        let x2:CGFloat = SVGPropertyParser.digit(xml,"x2");
        let y2:CGFloat = SVGPropertyParser.digit(xml,"y2");
        return SVGLine(x1, y1, x2, y2,style,id);
    }
    /**
     * Returns an SVGPolyLine element derived from the polyline data in @param xml with the @param style and @param id
     */
    class func polyLine(xml:NSXMLElement,style:SVGStyle,id:String)->SVGPolyLine? {
//		print("polyLine");
        if(!xml.hasAttribute(SVGConstants.points)) {return nil};
        var pointsString:String = xml[SVGConstants.points]!;
//			print("pointsString: " + pointsString);
        var points:Array<CGPoint> = [];
        var parameters:Array<CGFloat> = SVGPathParser.parameters(pointsString);
        for (var i : Int = 0; i < parameters.count; i+=2) {points.append(CGPoint(parameters[i],parameters[i+1]))}
        return SVGPolyLine(points,style,id);
    }
    /**
     * Returns an SVGPolygon element derived from the polygon data in @param xml with the @param style and @param id
     */
    class func polygon(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGPolygon {
//			print("polygon");
        if(!xml.hasOwnProperty("@"+SVGConstants.POINTS)) return null;
        var pointsString:String = xml["@"+SVGConstants.points];
//			print("pointsString: " + pointsString);
        var points:Array<CGPoint> = [];
        var parameters:Array = SVGPathParser.parameters(pointsString);
        for (var i : int = 0; i < parameters.length; i+=2) points.push(new Point(parameters[i],parameters[i+1]));
//			print("points: " + points);
        return new SVGPolygon(points,style,id);
    }
}

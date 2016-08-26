import Foundation
/**
 * SVG class is where pther svg elemnts is added
 * // :TODO: impliment xmlns:xlink,viewBox,enable-background,xml:space,
 * //preserveAspectRatio="xMinYMin meet"
 * //viewBox="0 0 90 90"
 * @example
 * <?xml version="1.0"?><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="768px" height="768px">
 * 		<rect x="64" y="64" fill="#0000FF" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 * </svg>
 * TODO: impliment text (<text x="60" y="165" style="font-family: sans-serif; font-size: 14pt; stroke: none; fill: black;">Cat</text>)
 */
class SVGParser {
    /**
     * Returns an SVGDoc instance derived from @param xml
     * @Note the regular expression removes the PX suffix
     */
    class func svg(xml:XML)->SVG {
        let viewBox:CGRect = SVGPropertyParser.viewBox(xml)//<--a fix for when the svg doc doesnt have width and height properties, then resort to using the viewBox.width and height
        let x:CGFloat = SVGPropertyParser.digit(xml,"x");
        let y:CGFloat = SVGPropertyParser.digit(xml,"y");
        var width:CGFloat = SVGPropertyParser.digit(xml,"width")
        width = !width.isNaN ? width : viewBox.width//<--a fix for when the svg doc doesnt have width and height properties, then resort to using the viewBox.width and height
        var height:CGFloat = SVGPropertyParser.digit(xml,"height");
        height = !height.isNaN ? height : viewBox.height//<--a fix for when the svg doc doesnt have width and height properties, then resort to using the viewBox.width and height
        let version:CGFloat = SVGPropertyParser.value(SVGPropertyParser.property(xml, "version"));
        let nameSpace:String = ""//xml.namespaceDeclarations().toString();//TODO: implement this later
        let id:String = SVGPropertyParser.id(xml);
        let doc:SVG = SVG([],x,y,width,height,version,nameSpace,id);
        let children:NSArray = xml.children!
        let count = children.count/*or use rootElement.childCount TODO: test this*/
        for (var i = 0; i < count; i++) {
            let child:XML = XMLParser.childAt(children, i)!
            doc.add(element(child,doc))//print("Import - child.toXMLString(): " + child.toXMLString());
        }
        return doc
    }
    /**
     * Returns An ISVG instance or SVGLinearGradient instance (For now, in the future other types will be added)
     * @Note: SVGParser.group uses this method to create elements from xml, and adds the group style to its decendants
     * // :TODO: Not sure what the purpose of this method is
     * // :TODO: add Radial gradient support
     * // :TODO: impliment title and desc elements see svg pdf <title>Grouped Drawing</title>   and   <desc>Stick-figure drawings of a house and people</desc>
     */
    class func element(xml:XML,_ container:ISVGContainer)->ISVGElement {
        var element:ISVGElement;
        let style:SVGStyle = SVGPropertyParser.style(xml, container)/*Creates the style*/
        if(container is SVGGroup && (container as! SVGGroup).style != nil) {SVGStyleModifier.merge(style, (container as! SVGGroup).style!)}/*parent style is inherited down to sub elements*/
        let id:String = SVGPropertyParser.id(xml);
        switch(xml.localName!){
            case SVGConstants.rect: element = rect(xml,style,id)
            case SVGConstants.polyLine: element =  polyLine(xml,style,id)!
            case SVGConstants.polygon: element = polygon(xml,style,id)!
            case SVGConstants.path: element = path(xml,style,id)!
            case SVGConstants.line: element = line(xml,style,id)
            case SVGConstants.circle: element = circle(xml,style,id)
            case SVGConstants.ellipse: element = ellipse(xml,style,id)
            case SVGConstants.group: element = group(xml,style,id)
            case SVGConstants.linearGradient: element = SVGGradientParser.linearGradient(xml)
            case SVGConstants.radialGradient: element = SVGGradientParser.radialGradient(xml)
            default: fatalError("SVG Element type not supported: " + xml.localName!)
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
    class func path(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGPath? {
        if(!xml.hasAttribute(SVGConstants.data)) {return nil}
        let pathDefinition:String = xml[String(SVGConstants.data)]!
		//print("SVGParser.path() pathDefinition: " + pathDefinition);
        let svgPathData:SVGPathData = SVGPathParser.pathData(pathDefinition);//[PathCommand.MOVE_TO,PathCommand.CURVE_TO], [0,0,100,0,200,200]
        return SVGPath(svgPathData.commands,svgPathData.parameters,style,id);
    }
    /**
     * Returns an SVGRect element derived from the rectangle data in @param xml with the @param style and @param id
     */
    class func rect(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGRect {
        let x:CGFloat = SVGPropertyParser.digit(xml,"x")
        let y:CGFloat = SVGPropertyParser.digit(xml,"y")
        let width:CGFloat = SVGPropertyParser.digit(xml,"width")
        let height:CGFloat = SVGPropertyParser.digit(xml,"height")
        let rx:CGFloat = SVGPropertyParser.digit(xml,"rx")
        let ry:CGFloat = SVGPropertyParser.digit(xml,"ry")
        return SVGRect(width, height, x, y, rx, ry, style, id)
    }
    /**
     * Returns an SVGLine element derived from the line data in @param xml with the @param style and @param id
     */
    class func line(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGLine {
        // :TODO: should return nil if there is no def ?!?
        let x1:CGFloat = SVGPropertyParser.digit(xml,"x1")
        let y1:CGFloat = SVGPropertyParser.digit(xml,"y1")
        let x2:CGFloat = SVGPropertyParser.digit(xml,"x2")
        let y2:CGFloat = SVGPropertyParser.digit(xml,"y2")
        return SVGLine(x1, y1, x2, y2,style,id)
    }
    /**
     * Returns an SVGPolyLine element derived from the polyline data in @param xml with the @param style and @param id
     */
    class func polyLine(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGPolyLine? {
//		print("polyLine");
        if(!xml.hasAttribute(SVGConstants.points)) {return nil}
        let pointsString:String = xml[SVGConstants.points]!
//		print("pointsString: " + pointsString);
        var points:Array<CGPoint> = []
        var parameters:Array<CGFloat> = SVGPathParser.parameters(pointsString);
        for (var i : Int = 0; i < parameters.count; i+=2) {points.append(CGPoint(parameters[i],parameters[i+1]))}
        return SVGPolyLine(points,style,id)
    }
    /**
     * Returns an SVGPolygon element derived from the polygon data in @param xml with the @param style and @param id
     */
    class func polygon(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGPolygon? {
		//print("SVGParser.polygon()");
        if(!xml.hasAttribute(SVGConstants.points)) {return nil}
        let pointsString:String = xml[SVGConstants.points]!
		//print("SVGParser.polygon() pointsString: " + pointsString);
        var points:Array<CGPoint> = []
        var parameters:Array<CGFloat> = SVGPathParser.parameters(pointsString);
        //print("SVGPArser.polygon() parameters: " + "\(parameters)");
        for (var i : Int = 0; i < parameters.count; i+=2) {points.append(CGPoint(parameters[i],parameters[i+1]))}
		//print("SVGPArser.polygon() points: " + "\(points)");
        return SVGPolygon(points,style,id)
    }
    /**
     * Returns an SVGCircle element derived from the circle data in @param xml with the @param style and @param id
     * @param xml (<circle cx="70" cy="95" r="50" style="stroke: black; fill: none" />)
     * // :TODO: if cx or cy isnt there it should defualt to 0
     */
    class func circle(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGCircle {
        let cx:CGFloat = SVGPropertyParser.digit(xml,"cx")
        let cy:CGFloat = SVGPropertyParser.digit(xml,"cy")
        let r:CGFloat = SVGPropertyParser.digit(xml,"r")
        return SVGCircle(cx, cy, r,style,id)
    }
    /**
     * Returns an SVGEllipse element derived from the ellipse data in @param xml with the @param style and @param id
     */
    class func ellipse(xml:NSXMLElement,_ style:SVGStyle,_ id:String)->SVGEllipse {
        let cx:CGFloat = SVGPropertyParser.digit(xml,"cx")
        let cy:CGFloat = SVGPropertyParser.digit(xml,"cy")
        let rx:CGFloat = SVGPropertyParser.digit(xml,"rx")
        let ry:CGFloat = SVGPropertyParser.digit(xml,"ry")
        return SVGEllipse(cx, cy, rx, ry,style,id)
    }
    /**
     * Describes all svg elements in a SVG instance, is not recursive yet
     * // :TODO: impliment SVGGroup
     */
    class func describeAll(svg:SVGContainer){
        Swift.print("SVGParser.describeAll()")
        for var i = 0; i < svg.items.count; ++i{
            let svgElement:ISVGElement = svg.items[i]
            if(svgElement is SVGPath){
                Swift.print((svgElement as! SVGPath).commands);
                Swift.print((svgElement as! SVGPath).parameters);
            }else if(svgElement is SVGPolygon){
                Swift.print("(element as! SVGPolygon).points: " + "\((svgElement as! SVGPolygon).points)")
                Swift.print("SVGPolygon: " + "\((svgElement as! SVGPolygon).points)");
            }else if(svgElement is SVGPolyLine){
                Swift.print((svgElement as! SVGPolyLine).points);
            }else if(svgElement is SVGRect){
                Swift.print("SVGRect: " + "\(svgElement)");
                Swift.print("width: " + " + \((svgElement as! SVGRect).width)")
                Swift.print("height: " + "\((svgElement as! SVGRect).height)")
                Swift.print("x: " + "\((svgElement as! SVGRect).x)")
                Swift.print("y: " + "\((svgElement as! SVGRect).y)")
            }else if(svgElement is SVGContainer){
                describeAll(svgElement as! SVGContainer)
            }else if(svgElement is SVGLinearGradient || svgElement is SVGRadialGradient){
                //not implemented yet
            }else{
                fatalError("\(svgElement)" + " is not supported yet")
            }
        }
    }
}
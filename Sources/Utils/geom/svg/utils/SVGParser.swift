import Foundation
/**
 * SVG class is where pther svg elemnts is added
 * TODO: impliment xmlns:xlink,viewBox,enable-background,xml:space,
 * //preserveAspectRatio="xMinYMin meet"
 * //viewBox="0 0 90 90"
 * TODO: ⚠️️ Add xml.namespaceDeclarations().toString();
 * EXAMPLE:
 * <?xml version="1.0"?><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="768px" height="768px">
 * 		<rect x="64" y="64" fill="#0000FF" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 * </svg>
 * TODO: impliment text (<text x="60" y="165" style="font-family: sans-serif; font-size: 14pt; stroke: none; fill: black;">Cat</text>)
 */
class SVGParser {
    /**
     * Returns an SVGDoc instance derived from PARAM: xml
     * NOTE: the regular expression removes the PX suffix
     */
    static func svg(_ xml:XML)->SVG {
        let viewBox:CGRect = SVGPropertyParser.viewBox(xml)//<--a fix for when the svg doc doesnt have width and height properties, then resort to using the viewBox.width and height
        let x:CGFloat = SVGPropertyParser.digit(xml,"x")
        let y:CGFloat = SVGPropertyParser.digit(xml,"y")
        let width:CGFloat = {
            let width = SVGPropertyParser.digit(xml,"width")
            return !width.isNaN ? width : viewBox.width//<--a fix for when the svg doc doesnt have width and height properties, then resort to using the viewBox.width and height
        }()
        let height:CGFloat = {
            let height = SVGPropertyParser.digit(xml,"height")
            return !height.isNaN ? height : viewBox.height//<--a fix for when the svg doc doesnt have width and height properties, then resort to using the viewBox.width and height
        }()
        let version:CGFloat = SVGPropertyParser.value(SVGPropertyParser.property(xml, "version"))
        let nameSpace:String = ""
        let id:String = SVGPropertyParser.id(xml)
        let doc:SVG = SVG([],x,y,width,height,version,nameSpace,id)
        xml.children?.forEach{
            if let elm = element($0 as! XML,doc) {doc.add(elm)}//print("Import - child.toXMLString(): " + child.toXMLString());
        }
        return doc
    }
    /**
     * Returns An ISVG instance or SVGLinearGradient instance (For now, in the future other types will be added)
     * NOTE: SVGParser.group uses this method to create elements from xml, and adds the group style to its decendants
     * TODO: Not sure what the purpose of this method is
     * TODO: add Radial gradient support
     * TODO: impliment title and desc elements see svg pdf <title>Grouped Drawing</title>   and   <desc>Stick-figure drawings of a house and people</desc>
     */
    static func element(_ xml:XML,_ container:SVGContainable)->SVGElementKind? {
        var style:SVGStyle = SVGPropertyParser.style(xml, container)/*Creates the style*/
        if let container = container as? SVGGroup, let containerStyle = container.style{
            SVGStyleModifier.merge(&style, containerStyle)/*parent style is inherited down to sub elements*/
        }
        let id:String = SVGPropertyParser.id(xml)
        let type = SVGConstants(rawValue:xml.localName!)
        switch(type){
            case .rect?: return rect(xml,style,id)
            case .polyLine?:  return polyLine(xml,style,id)!
            case .polygon?: return polygon(xml,style,id)!
            case .path?: return path(xml,style,id)!
            case .line?: return line(xml,style,id)
            case .circle?: return circle(xml,style,id)
            case .ellipse?: return ellipse(xml,style,id)
            case .group?: return group(xml,style,id)
            case .linearGradient?: return SVGGradientParser.linearGradient(xml)
            case .radialGradient?: return SVGGradientParser.radialGradient(xml)
            default: fatalError("SVG Element type not supported: \(xml.localName!)")/*IS can export <defs></defs>*/
        }
    }
    /**
     * Returns a Group instance comprised of svg elements derived from PARAM: xml
     * PARAM: xml (<g id="whiskers"></g>)
     * TODO: impliment support for Desc and title elements to be added to group <desc>House with door</desc>
     */
    static func group(_ xml:XML, _ style:SVGStyle, _ id:String) -> SVGGroup {
        let group:SVGGroup = SVGGroup([],style,id)
        group.items = xml.children?.lazy.map{ child -> SVGElementKind? in
                let child:XML = child as! XML
                return element(child,group)
            }.flatMap{
                return $0
        } ?? []
        return group
    }
    /**
     * Returns an SVGPath element derived from the path data in PARAM: xml with the PARAM: style and PARAM: id
     * EXAMPLE: <path d="M 10 10, L 40 10, L 40 30, L 10 30, L 10 10" />//rectangle; all four lines
     * EXAMPLE: <path d="M 60 10, L 90 10, L 90 30, L 60 30, Z" /> //rectangle with closepath
     * EXAMPLE: <path d="M 30 30 L 55 5 L 80 30 L 55 55 Z" />
     * EXAMPLE: <path d="M 12 24 h 15 v 25 h -15 z"/> //
     * // :TODO: remember to differentiate between Uppercase and lower case
     */
    static func path(_ xml:XML,_ style:SVGStyle,_ id:String)->SVGPath? {
        if let pathDefinition = xml[SVGConstants.data.rawValue]{
            let svgPathData:SVGPathData = SVGPathParser.pathData(pathDefinition)//[PathCommand.MOVE_TO,PathCommand.CURVE_TO], [0,0,100,0,200,200]
            return SVGPath(svgPathData.commands,svgPathData.parameters,style,id)
        }
        return nil
    }
    /**
     * Returns an SVGRect element derived from the rectangle data in PARAM: xml with the PARAM: style and PARAM: id
     */
    static func rect(_ xml:XML,_ style:SVGStyle,_ id:String)->SVGRect {
        let x:CGFloat = SVGPropertyParser.digit(xml,"x")
        let y:CGFloat = SVGPropertyParser.digit(xml,"y")
        let width:CGFloat = SVGPropertyParser.digit(xml,"width")
        let height:CGFloat = SVGPropertyParser.digit(xml,"height")
        let rx:CGFloat = SVGPropertyParser.digit(xml,"rx")
        let ry:CGFloat = SVGPropertyParser.digit(xml,"ry")
        return SVGRect(width, height, x, y, rx, ry, style, id)
    }
    /**
     * Returns an SVGLine element derived from the line data in PARAM: xml with the PARAM: style and PARAM: id
     * TODO: ⚠️️ should return nil if there is no def ?!?
     */
    static func line(_ xml:XML,_ style:SVGStyle,_ id:String)->SVGLine {
        let x1:CGFloat = SVGPropertyParser.digit(xml,"x1")
        let y1:CGFloat = SVGPropertyParser.digit(xml,"y1")
        let x2:CGFloat = SVGPropertyParser.digit(xml,"x2")
        let y2:CGFloat = SVGPropertyParser.digit(xml,"y2")
        return SVGLine(x1, y1, x2, y2,style,id)
    }
    /**
     * Returns an SVGPolyLine element derived from the polyline data in PARAM: xml with the PARAM: style and PARAM: id
     */
    static func polyLine(_ xml:XML,_ style:SVGStyle,_ id:String)->SVGPolyLine? {
        if let pointsString:String = xml[SVGConstants.points.rawValue]{
            let params:[CGFloat] = SVGPathParser.parameters(pointsString)
            let points:[CGPoint] = stride(from: 0, to: params.count, by: 2).map{ i in
                CGPoint(params[i],params[i+1])
            }
            return SVGPolyLine(points,style,id)
        }
        return nil
    }
    /**
     * Returns an SVGPolygon element derived from the polygon data in PARAM: xml with the PARAM: style and PARAM: id
     */
    static func polygon(_ xml:XML,_ style:SVGStyle,_ id:String)->SVGPolygon? {
        if let pointsString:String = xml[SVGConstants.points.rawValue]{
            let parameters:[CGFloat] = SVGPathParser.parameters(pointsString)
            let points:[CGPoint] = stride(from: 0, to: parameters.count, by: 2).map { i in/*<--this line was upgraded to wift 3.0, stride instead of c-loop*/
                CGPoint(parameters[i],parameters[i+1])
            }
            return SVGPolygon(points,style,id)
        }
        return nil
    }
    /**
     * Returns an SVGCircle element derived from the circle data in PARAM: xml with the PARAM: style and PARAM: id
     * PARAM: xml (<circle cx="70" cy="95" r="50" style="stroke: black; fill: none" />)
     * TODO: if cx or cy isnt there it should defualt to 0
     */
    static func circle(_ xml:XML,_ style:SVGStyle,_ id:String)->SVGCircle {
        let cx:CGFloat = SVGPropertyParser.digit(xml,"cx")
        let cy:CGFloat = SVGPropertyParser.digit(xml,"cy")
        let r:CGFloat = SVGPropertyParser.digit(xml,"r")
        return SVGCircle(cx, cy, r,style,id)
    }
    /**
     * Returns an SVGEllipse element derived from the ellipse data in PARAM: xml with the PARAM: style and PARAM: id
     */
    static func ellipse(_ xml:XMLElement,_ style:SVGStyle,_ id:String)->SVGEllipse {
        let cx:CGFloat = SVGPropertyParser.digit(xml,"cx")
        let cy:CGFloat = SVGPropertyParser.digit(xml,"cy")
        let rx:CGFloat = SVGPropertyParser.digit(xml,"rx")
        let ry:CGFloat = SVGPropertyParser.digit(xml,"ry")
        return SVGEllipse(cx, cy, rx, ry,style,id)
    }
    /**
     * Describes all svg elements in a SVG instance, is not recursive yet
     * TODO: impliment SVGGroup
     */
    static func describeAll(_ svg:SVGContainer){
        Swift.print("SVGParser.describeAll()")
        svg.items.forEach{ svgElement in
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
                Swift.print("width: " + " + \((svgElement as! SVGRect).rect.w)")
                Swift.print("height: " + "\((svgElement as! SVGRect).rect.h)")
                Swift.print("x: " + "\((svgElement as! SVGRect).frame.x)")
                Swift.print("y: " + "\((svgElement as! SVGRect).frame.y)")
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

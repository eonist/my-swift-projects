import Foundation

class SVGModifier {
	/**
	 * Offsets each item in a svg by @param offset (Point)
	 * // :TODO: add support for other SVG elements as well, use switch method instead of if
	 */
	class func offsetItems(svg:SVG, _ offset:CGPoint) {
		for (var i : Int = 0; i < svg.items.count; i++) {
			let svgGraphic:SVGGraphic = svg.items[i] as! SVGGraphic;
			if(svgGraphic is SVGLine){
				(svgGraphic as! SVGLine).x1 += offset.x;
				(svgGraphic as! SVGLine).x2 += offset.x;
				(svgGraphic as! SVGLine).y1 += offset.y;
				(svgGraphic as! SVGLine).y2 += offset.y;
			}else if(svgGraphic is SVGRect){
				(svgGraphic as! SVGRect).x += offset.x;
				(svgGraphic as! SVGRect).y += offset.y;
			}
		}
	}
	/**
	 * Scales SVG elements at @param pivot to @param scale (0-1) 
	 * @param scalePoint (0 - 1)
	 * @Note this method is recursive
	 * @example SVGModifier.scale(svg, new Point(0,0), new Point(0.5,0.5));
     * @NOTE: The stroke thickness isnt scaled, is this correct or?
	 */
	class func scale(element:ISVGElement,_ pivot:CGPoint, _ scale:CGPoint) {
		switch(true){
			case element is SVGPolyLine:(element as! SVGPolyLine).points = PointModifier.scalePoints((element as! SVGPolyLine).points, pivot, scale);/*SVGPolyLine,SVGPolygon*/break;
            case element is SVGPolygon:SVGPolygonModifier.scale(&(element as! SVGPolygon), pivot, scale);/*SVGPolyLine,SVGPolygon*/break;
			case element is SVGRect:SVGRectModifier.scale(element as! SVGRect, pivot, scale);break;
			case element is SVGLine:SVGLineModifier.scale(element as! SVGLine,pivot,scale);break;
			case element is SVGPath:SVGPathModifier.scale(element as! SVGPath, pivot, scale);break;
			case element is SVGCircle:SVGCircleModifier.scale(element as! SVGCircle, pivot, scale);break;
			case element is SVGEllipse:SVGEllipseModifier.scale(element as! SVGEllipse, pivot, scale);break;
			case element is SVGContainer:SVGContainerModifier.scale(element as! SVGContainer,pivot,scale);break;
			case element is SVGGradient:SVGGradientModifier.scale(element as! SVGGradient, pivot, scale);break;/*The individual style.gradient.transform instances are scaled so why do we need to scale this? It may be usefull for export purpouses*/
            default: break;
		}
        if(element is ISVGGraphic) {update(element as! ISVGGraphic)}//<---this may need to not use a protocol for casting
	}
	/**
	 * Styles an @param element with @param style
	 * // :TODO: rename to stylize?
	 * @Note this method is recursive
	 */
	class func style(element:ISVGElement,_ style:SVGStyle) {
        if(element is SVGView) {(element as! SVGView).style = style}
        if(element is SVGGraphic) {update(element as! SVGGraphic)}
        if(element is SVGContainer) {
            for (var i : Int = 0; i < (element as! SVGContainer).items.count; i++){
                if((element as! SVGContainer).items[i] is ISVGView) {SVGModifier.style((element as! SVGContainer).items[i], style)}
            }
        }
	}
	/**
	 * updates an SVGGraphic
	 */
	class func update(graphic:ISVGGraphic) {
        //WARNING: this method is incomplete, needs correct order of calls etc
        
		//graphic.clear();
		//graphic.applyLineStyle();/*<--this was recently taken away, I think this call is called by swift it self down the line*/
		//graphic.beginFill();/*<--this was recently taken away, I think this call is called by swift it self down the line*/
		graphic.draw();/*<--draws the path with the new params*/
		//graphic.endFill();
        graphic.fillShape.setNeedsDisplay()/*there needs to be an update to the beginFill and applyLineStyll since gradient matrices may have changed etc, but the call must be a request not a direct call since the context isnt ready yet*/
        graphic.lineShape.setNeedsDisplay()
	}
}

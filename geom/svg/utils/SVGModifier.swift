import Foundation

class SVGModifier {
	/**
	 * Offsets each item in a svg by @param offset (Point)
	 * TODO: add support for other SVG elements as well, use switch method instead of if
     * NOTE this method is incomplete, needs a call to update and support for fusing the gradient to the svg item after the change, since reference gradients may be used for other items. so we cant change this
	 */
	static func offsetItems(_ svg:SVG, _ offset:CGPoint) {
		for i in 0..<svg.items.count{
			let svgGraphic = svg.items[i]
			if(svgGraphic is SVGLine){
				(svgGraphic as! SVGLine).x1 += offset.x
				(svgGraphic as! SVGLine).x2 += offset.x
				(svgGraphic as! SVGLine).y1 += offset.y
				(svgGraphic as! SVGLine).y2 += offset.y
			}else if(svgGraphic is SVGRect){
				(svgGraphic as! SVGRect).frame.x += offset.x
				(svgGraphic as! SVGRect).frame.y += offset.y
            }else if(svgGraphic is SVGCircle){
                (svgGraphic as! SVGCircle).cx += offset.x
                (svgGraphic as! SVGCircle).cy += offset.y
            }else{
                fatalError("type not supported yet")
                //type not supported yet
            }
		}
	}
	/**
	 * Scales SVG elements at @param pivot to @param scale (0-1) 
	 * PARAM: scalePoint (0 - 1)
	 * NOTE: this method is recursive
     * NOTE: The stroke thickness isnt scaled, is this correct or?
     * NOTE: When you scale an Element and the Element has a SVGGradient asits fill or line, then the original SVGGradient isnt scaled per se, so if you want the gradient to follow the shape then either also scale the gradient (make sure the gradient isnt attached to other shapes) or make sure the gradient uses non-absolute values, like objectBounidngbox as the gradientUnits and % values for the x1,y2,x2,y2 values etc, one could also imagine a system were you scale only the gradient attached to the Element, that would require some more code though and is not needed for the imidiate usecase
	 * EXAMPLE SVGModifier.scale(svg, new Point(0,0), new Point(0.5,0.5));
	 */
	static func scale(_ element:ISVGElement,_ pivot:CGPoint, _ scale:CGPoint) {
		//Swift.print("SVGModifier.scale() element: " + "\(element)")
        switch(true){
			case element is SVGPolyLine:PointModifier.scalePoints(&(element as! SVGPolyLine).points, pivot, scale);/*SVGPolyLine,SVGPolygon*/break;
            case element is SVGPolygon:PointModifier.scalePoints(&(element as! SVGPolygon).points, pivot, scale);break;
			case element is SVGRect:SVGRectModifier.scale(element as! SVGRect, pivot, scale);break;
			case element is SVGLine:SVGLineModifier.scale(element as! SVGLine,pivot,scale);break;
			case element is SVGPath:SVGPathModifier.scale(element as! SVGPath , pivot, scale);break;
			case element is SVGCircle:SVGCircleModifier.scale(element as! SVGCircle, pivot, scale);break;
			case element is SVGEllipse:SVGEllipseModifier.scale(element as! SVGEllipse, pivot, scale);break;
			case element is SVGContainer:SVGContainerModifier.scale(element as! SVGContainer,pivot,scale);break;
			case element is SVGGradient:SVGGradientModifier.scale(element as! SVGGradient, pivot, scale);break;/*The individual style.gradient.transform instances are scaled so why do we need to scale this? It may be usefull for export purpouses*/
            default: break;
		}
        if(element is ISVGGraphic) {SVGModifier.update(element as! SVGGraphic)}//<---this may need to not use a protocol for casting
	}
	/**
	 * Styles an PARAM: element with PARAM: style
	 * TODO: rename to stylize?
	 * NOTE: this method is recursive
	 */
	static func style(_ element:ISVGElement,_ style:SVGStyle) {
        //Swift.print("SVGModifier.style() ")
        if(element is SVGView) {(element as! SVGView).style = style}
        if(element is SVGGraphic) {SVGModifier.update(element as! SVGGraphic)}
        if(element is SVGContainer) {
            for i in 0..<(element as! SVGContainer).items.count{//swift3 upgrade
                if((element as! SVGContainer).items[i] is ISVGView) {SVGModifier.style((element as! SVGContainer).items[i], style)}
            }
        }
	}
    /**
     * Updates an SVGGraphic
     */
    static func update(_ graphic:SVGGraphic) {
        //Swift.print("SVGModifier.update()")
        //WARNING: this method is incomplete, needs correct order of calls etc
        graphic.draw();/*<--draws the path with the new params*/
        
        //graphic.endFill();
        graphic.fillShape.setNeedsDisplay()/*there needs to be an update to the beginFill and applyLineStyll since gradient matrices may have changed etc, but the call must be a request not a direct call since the context isnt ready yet*/
        graphic.lineShape.setNeedsDisplay()
    }
}

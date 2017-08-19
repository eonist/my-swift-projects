import Foundation

class SVGModifier {
	/**
	 * Offsets each item in a svg by PARAM: offset (Point)
	 * TODO: Add support for other SVG elements as well, use switch method instead of if
     * NOTE This method is incomplete, needs a call to update and support for fusing the gradient to the svg item after the change, since reference gradients may be used for other items. so we cant change this
	 */
	static func offsetItems(_ svg:SVG, _ offset:CGPoint) {
		svg.items.forEach { svgGraphic in
            switch svgGraphic{
                case let svgGraphic as SVGLine:
                    svgGraphic.x1 += offset.x
                    svgGraphic.x2 += offset.x
                    svgGraphic.y1 += offset.y
                    svgGraphic.y2 += offset.y
                case let svgGraphic as SVGRect:
                    svgGraphic.frame.x += offset.x
                    svgGraphic.frame.y += offset.y
                case let svgGraphic as SVGCircle:
                    svgGraphic.cX += offset.x
                    svgGraphic.cy += offset.y
                default:
                    fatalError("type not supported yet")
            }
		}
	}
	/**
	 * Scales SVG elements at PARAM: pivot to PARAM: scale (0-1) 
     * NOTE: Scales the data not NSView.scale property
	 * PARAM: scalePoint (0 - 1)
	 * NOTE: this method is recursive
     * NOTE: The stroke thickness isnt scaled, is this correct or?
     * NOTE: When you scale an Element and the Element has a SVGGradient asits fill or line, then the original SVGGradient isnt scaled per se, so if you want the gradient to follow the shape then either also scale the gradient (make sure the gradient isnt attached to other shapes) or make sure the gradient uses non-absolute values, like objectBounidngbox as the gradientUnits and % values for the x1,y2,x2,y2 values etc, one could also imagine a system were you scale only the gradient attached to the Element, that would require some more code though and is not needed for the imidiate usecase
	 * EXAMPLE SVGModifier.scale(svg, Point(0,0), Point(0.5,0.5))
	 */
	static func scale(_ element:SVGElementKind,_ pivot:CGPoint, _ scale:CGPoint) {
        switch(element){
            case let element as SVGPolyLine:CGPointModifier.scalePoints(&element.points, pivot, scale)/*SVGPolyLine,SVGPolygon*/
            case let element as SVGPolygon:CGPointModifier.scalePoints(&element.points, pivot, scale)
            case let element as SVGRect:SVGRectModifier.scale(element, pivot, scale)
            case let element as SVGLine:SVGLineModifier.scale(element,pivot,scale)
            case let element as SVGPath:SVGPathModifier.scale(element , pivot, scale)
            case let element as SVGCircle:SVGCircleModifier.scale(element, pivot, scale)
            case let element as SVGEllipse:SVGEllipseModifier.scale(element, pivot, scale)
            case let element as SVGContainer:SVGContainerModifier.scale(element ,pivot,scale)
            case var element as SVGGradient:SVGGradientModifier.scale(&element , pivot, scale)/*The individual style.gradient.transform instances are scaled so why do we need to scale this? It may be usefull for export purpouses*/
            default: break;
		}
        if let element = element as? SVGGraphic {SVGModifier.update(element)}
	}
	/**
	 * Styles an PARAM: element with PARAM: style
	 * TODO: rename to stylize?
	 * NOTE: this method is recursive
	 */
	static func style(_ element:SVGElementKind,_ style:SVGStyle) {
        if let element = element as? SVGView {element.style = style}
        if let element = element as? SVGGraphic {SVGModifier.update(element)}
        if let element = element as? SVGContainer {
            element.items.forEach{ item in
                if let item = item as? SVGViewable {SVGModifier.style(item, style)}
            }
        }
	}
    /**
     * Updates an SVGGraphic
     */
    static func update(_ graphic:SVGGraphic) {
        graphic.draw()/*<--draws the path with the new params*/
        graphic.fillShape.setNeedsDisplay()/*there needs to be an update to the beginFill and applyLineStyll since gradient matrices may have changed etc, but the call must be a request not a direct call since the context isnt ready yet*/
        graphic.lineShape.setNeedsDisplay()
    }
}

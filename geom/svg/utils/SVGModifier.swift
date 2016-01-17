import Foundation

class SVGModifier {
	
    /**
     *
     */
    class func dsc(inout svg:SVGContainer,_ pivot:CGPoint,_ scalePoint:CGPoint){
        for var i = 0; i < svg.items.count; ++i{
            if(svg.items[i] is SVGContainer){
                let svgContainer:SVGContainer = svg.items[i] as! SVGContainer
                for var e = 0; e < svg.items.count; ++e{
                    if((svg.items[i] as! SVGContainer).items[e] is SVGPath){
                        Swift.print((svgContainer.items[e] as! SVGPath).parameters)
                    }
                }
            }else{
                fatalError("no")
            }
        }
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

}



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
     * updates an SVGGraphic
     */
    class func update(graphic:ISVGGraphic) {
        Swift.print("update")
        //WARNING: this method is incomplete, needs correct order of calls etc
        graphic.draw();/*<--draws the path with the new params*/
        
        //graphic.endFill();
        graphic.fillShape.setNeedsDisplay()/*there needs to be an update to the beginFill and applyLineStyll since gradient matrices may have changed etc, but the call must be a request not a direct call since the context isnt ready yet*/
        graphic.lineShape.setNeedsDisplay()
    }
    

}



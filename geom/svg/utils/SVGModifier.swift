import Foundation

class SVGModifier {
	
    
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



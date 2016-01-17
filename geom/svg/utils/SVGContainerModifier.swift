import Foundation

class SVGContainerModifier {
	/**
	 * scales the SVGContainer 
	 */
	class func scale(inout container:SVGContainer,_ pivot:CGPoint,_ scale:CGPoint) {
		let position:CGPoint = PointModifier.scale(container.frame.origin, pivot, scale);
		let size:CGSize = CGSize(container.frame.width * scale.x, container.frame.height * scale.y);
		container.frame.origin = position;
		container.frame.size = size;
        for var i = 0; i < container.items.count; ++i{
            let element : ISVGElement = container.items[i]
            if(element is SVGRect){
                
                Swift.print("rect: " + "\(element)")
                Swift.print("rect.x: " + "\((element as! SVGRect).x)")
                Swift.print("rect.w: " + "\((element as! SVGRect).width)")
            }
            SVGModifier.scale(element, pivot, scale)
        }
        /*for element : ISVGElement in container.items{
        
        }*/
	}
}

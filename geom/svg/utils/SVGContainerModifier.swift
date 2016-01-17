import Foundation

class SVGContainerModifier {
	/**
	 * scales the SVGContainer 
	 */
	class func scale(container:SVGContainer,_ pivot:CGPoint,_ scale:CGPoint) {
		let position:CGPoint = PointModifier.scale(container.frame.origin, pivot, scale);
		let size:CGSize = CGSize(container.frame.width * scale.x, container.frame.height * scale.y);
		container.frame.origin = position;
		container.frame.size = size;
        for element : ISVGElement in container.items{SVGModifier.scale(element, pivot, scale)}/**/
	}
}

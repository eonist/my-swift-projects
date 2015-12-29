import Foundation

class SVGContainerModifier {
	/**
	 * scales the SVGContainer 
	 */
	class func scale(container:SVGContainer,pivot:CGPoint,scale:CGPoint) {
		var position:CGPoint = PointModifier.scalePoint(new CGPoint(container.x,container.y), pivot, scale);
		var size:CGPoint = new Point(container.width * scale.x, container.height * scale.y);
		container.x = position.x;
		container.y = position.y;
		container.width = size.x;
		container.height = size.y;
		for each (var element : ISVGElement in container.items) SVGModifier.scale(element, pivot, scale);
	}
}

import Foundation

class SVGContainerModifier {
	/**
	 * Scales the SVGContainer 
	 */
	static func scale(_ container:SVGContainer,_ pivot:CGPoint,_ scale:CGPoint) {
		let position:CGPoint = CGPointModifier.scale(container.frame.origin, pivot, scale)
		let size:CGSize = CGSize(container.frame.width * scale.x, container.frame.height * scale.y)
		container.frame.origin = position
		container.frame.size = size
        container.items.forEach{SVGModifier.scale($0, pivot, scale)}
	}
}

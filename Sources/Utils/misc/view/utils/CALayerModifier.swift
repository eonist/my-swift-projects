import Cocoa


class CALayerModifier {
    /**
     * New
     * NOTE: You can do this with view.setBoundsOrigin(pivot) + view.rotate(byDegrees: rotation) (But you have to take into account that If your flipping the coordinate sys, then you have to consider that aswell)
     */
    static func rotate(_ layer:CALayer,_ rotation:CGFloat,_ pivot:CGPoint){
        //Swift.print("rotate via pivot pivot: \(pivot)")
        let radians:CGFloat = rotation / 180.0 * CGFloat.pi
        let transform = CGTransform.rotateAroundPoint(CGAffineTransform.identity, radians,pivot)
        layer.setAffineTransform(transform)
    }
}

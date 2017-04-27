import Cocoa

extension CALayer {
    /**
     *
     */
    func rotate(_ rotation:CGFloat,_ pivot:CGPoint){
        CALayerModifier.rotate(self, rotation, pivot)
    }
}

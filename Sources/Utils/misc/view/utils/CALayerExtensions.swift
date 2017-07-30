import Cocoa

extension CALayer {
    /**
     *
     */
    func rotate(_ rotation:CGFloat,_ pivot:CGPoint){
        CALayerModifier.rotate(self, rotation, pivot)
    }
    /**
     * New, great in conjunction wtih closure callback's
     */
    func setPos(_ point:CGPoint){
        self.position = point
    }
}

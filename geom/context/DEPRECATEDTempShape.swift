import Cocoa

class TempShape:Shape{
    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
        Swift.print("TempShape.drawLayer")
    }  
}
import Foundation

class FillStyleParser {
    /**
     * NOTE: You could also add this as a Descrieable extension on the ILineStyle protocol but, its convenient enough to keep it here. 
     */
    class func describe(_ fillStyle:FillStyleKind){
        Swift.print("FillStyleParser.describe()")
        Swift.print("fillStyle.color.hex: " + "\(fillStyle.color.hexString)")
        Swift.print("fillStyle.color.alphaComponent: " + "\(fillStyle.color.alphaComponent)")
    }
    /**
     * TODO: Doesn't support GradientFillStyle yet
     */
    class func clone(_ fillStyle:FillStyleKind) -> FillStyleKind {
        return FillStyle(fillStyle.color)
    }
}

import Foundation

class FillShape :Shape{
    var fillStyle:IFillStyle?
    init(fillStyle:IFillStyle? = nil) {
        super.init()
        self.fillStyle = fillStyle
    }
}

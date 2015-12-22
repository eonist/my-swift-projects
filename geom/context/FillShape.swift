import Foundation

class FillShape :Shape{
    var fillStyle:IFillStyle?
    init(_ fillStyle:IFillStyle? = nil) {
        super.init()
        self.fillStyle = fillStyle
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

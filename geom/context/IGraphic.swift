import Cocoa

protocol IGraphic {
    var fillShape:Shape{get}
    var lineShape:Shape{get}
    var lineStyle:ILineStyle?{get set}
    var fillStyle:IFillStyle?{get set}
    func setProperties(fillStyle:IFillStyle?, lineStyle:ILineStyle?)
    var lineOffsetType:OffsetType{get set}
}
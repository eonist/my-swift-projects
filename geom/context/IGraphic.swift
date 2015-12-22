import Cocoa

protocol IGraphic {
    var fillShape:FillShape{get}
    var lineShape:Shape{get}
    var lineStyle:ILineStyle?{get}
    var fillStyle:IFillStyle?{get}
    func setProperties(fillStyle:IFillStyle?, lineStyle:ILineStyle?)
    var lineOffsetType:OffsetType{get set}
}

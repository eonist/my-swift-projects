import Cocoa

typealias IGraphic = GraphicKind
protocol IGraphic {
    var fillShape:Shape{get}
    var lineShape:Shape{get}
    var lineStyle:ILineStyle?{get set}
    var fillStyle:IFillStyle?{get set}
    var lineOffsetType:OffsetType{get set}
}

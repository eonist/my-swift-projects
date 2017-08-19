import Cocoa

protocol GraphicKind {
    var fillShape:Shape{get}
    var lineShape:Shape{get}
    var lineStyle:LineStylable?{get set}
    var fillStyle:FillStyleKind?{get set}
    var lineOffsetType:OffsetType{get set}
}

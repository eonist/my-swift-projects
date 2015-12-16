import Foundation

class IGraphic {
    var lineStyle:ILineStyle?{get}
    var fillStyle:IFillStyle?{get}
    func setProperties(fillStyle:IFillStyle?, lineStyle:ILineStyle?)
    var lineOffsetType:OffsetType{get set}
    var path:CGMutablePath{get set}
    var linePath:CGMutablePath{get set}
}

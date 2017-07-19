import Foundation

typealias IGraphicStyle = GraphicStyleKind/*Legacy support*/
protocol GraphicStyleKind {
    var fillStyle:IFillStyle? {get set}
    var lineStyle:ILineStyle? {get set}
}
extension GraphicStyleKind{/*Convenince*/
    var fill:IFillStyle? {get{return fillStyle} set{fillStyle = newValue}}
    var line:ILineStyle? {get{return lineStyle} set{lineStyle = newValue}}
}

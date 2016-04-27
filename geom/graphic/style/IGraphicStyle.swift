import Foundation

protocol IGraphicStyle {
    var fillStyle:IFillStyle? { get set }
    var lineStyle:ILineStyle? { get set }
}
extension IGraphicStyle{/*just for convenince*/
    var fill:IFillStyle? {get{return fillStyle} set{fillStyle = newValue}}
    var line:ILineStyle? {get{return lineStyle} set{lineStyle = newValue}}
}
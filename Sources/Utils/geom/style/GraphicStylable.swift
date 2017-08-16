import Foundation

protocol GraphicStylable {
    var fillStyle:FillStyleKind? {get set}
    var lineStyle:LineStylable? {get set}
}
extension GraphicStylable{/*Convenince*/
    var fill:FillStyleKind? {get{return fillStyle} set{fillStyle = newValue}}
    var line:LineStylable? {get{return lineStyle} set{lineStyle = newValue}}
}

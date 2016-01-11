import Foundation

protocol ISVGGraphic {
    var fillShape:Shape{get set}
    var lineShape:Shape{get set}
    func draw()
    //func drawLine()
    //func drawFill()
    func fill()
    func line()
    func beginFill()
    func applyLineStyle()
}
import Foundation
typealias ISVGGraphic = SVGGraphicKind/*Legacy support*/
protocol SVGGraphicKind:SVGViewable {/*<--extends ISVGView to inherit the style getter and setter*/
    var fillShape:Shape{get set}
    var lineShape:Shape{get set}
    func draw()
    func fill()
    func line()
    func beginFill()
    func applyLineStyle()
}

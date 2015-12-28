import Foundation
/**
 * Interface for SVGView
 */
protocol ISVGView : ISVGElement{
    func style() -> SVGStyle
    func style(style : SVGStyle)
}
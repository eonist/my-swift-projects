import Foundation
/**
 * Interface for the SVGPolyLine class
 */
typealias ISVGGraphic = SVGGraphicKind/*Legacy support*/
protocol ISVGPolyLine {
    var points:[CGPoint] {get set}
}

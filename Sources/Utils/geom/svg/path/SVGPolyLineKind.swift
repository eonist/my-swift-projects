import Foundation
/**
 * Interface for the SVGPolyLine class
 */
typealias ISVGPolyLine = SVGPolyLineKind/*Legacy support*/
protocol SVGPolyLineKind {
    var points:[CGPoint] {get set}
}

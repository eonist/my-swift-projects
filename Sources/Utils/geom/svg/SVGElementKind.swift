import Foundation
/**
 * Interface for SVGElement
 */
typealias ISVGElement = SVGElementKind/*Legacy support*/
protocol SVGElementKind {
    var id:String {get set}
}

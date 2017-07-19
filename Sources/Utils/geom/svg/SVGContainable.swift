import Foundation
/**
 * Protocol for SVGContainer
 */
typealias ISVGContainer = SVGContainable/*Legacy support*/
protocol SVGContainable:SVGElementKind{
    func add(_ element:SVGElementKind)
    var items:[ISVGElement] {get}
    func getItem(_ id:String)->SVGElementKind?
}

import Foundation
/**
 * Interface for SVGContainer
 */
typealias ISVGContainer = SVGContainable
protocol SVGContainable:SVGElementKind{
    func add(_ element:SVGElementKind)
    var items:[ISVGElement] {get}
    func getItem(_ id:String)->SVGElementKind?
}

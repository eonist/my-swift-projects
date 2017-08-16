import Foundation
/**
 * Protocol for SVGContainer
 */
protocol SVGContainable:SVGElementKind{
    func add(_ element:SVGElementKind)
    var items:[SVGElementKind] {get}
    func getItem(_ id:String)->SVGElementKind?
}

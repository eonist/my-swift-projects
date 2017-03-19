import Foundation
/**
 * Interface for SVGContainer
 */
protocol ISVGContainer:ISVGElement{
    func add(_ element:ISVGElement)
    var items:[ISVGElement] {get}
    func getItem(_ id:String)->ISVGElement?
}
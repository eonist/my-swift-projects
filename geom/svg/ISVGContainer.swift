import Foundation
/**
 * interface for SVGContainer
 */
protocol ISVGContainer : ISVGElement{
    func add(element:ISVGElement)
    func get items() : Array
    func getItem(id:String):*
}

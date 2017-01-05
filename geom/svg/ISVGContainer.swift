import Foundation
/**
 * Interface for SVGContainer
 */
protocol ISVGContainer : ISVGElement{
    func add(element:ISVGElement)
    var items : Array<ISVGElement> {get}
    func getItem(id:String)->ISVGElement?
}
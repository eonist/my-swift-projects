import Foundation
/**
 * Protocol for SVGView 
 */
typealias ISVGView = SVGViewable/*Legacy support*/
protocol SVGViewable:ISVGElement{
    var style:SVGStyle?{get set}
}

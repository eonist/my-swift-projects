import Foundation
/**
 * Protocol for SVGView 
 */
typealias ISVGView = SVGViewable
protocol SVGViewable:ISVGElement{
    var style:SVGStyle?{get set}
}

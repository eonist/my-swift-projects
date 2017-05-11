import Foundation
/**
 * The SVG commands represented here are from the official SVG syntax
 */
enum SVGPathCommand:String {
    case m = "m"/*Move*/
    case l = "l"/*Line*/
    case c = "c"/*Cubic-Curve*/
    case s = "s"/*smooth Cubic curve command*/
    case q = "q"/*Quad-curve*/
    case t = "t"/*smooth quadratic curve command*/
    case a = "a"/*Arc*/
    case h = "h"/*Horizontal*/
    case v = "v"/*Vertical*/
    case z = "z"/*Return to last Move*/
}

extension SVGPathCommand{
    init?(rawValue: SVGPathCommand.RawValue) {
        
    }
}

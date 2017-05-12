import Foundation
/**
 * The SVG commands represented here are from the official SVG syntax
 * NOTE: ⚠️️ You dont need the cases to use this method. Works with .init(rawValue:str) alone
 */
enum SVGPathCommands:Character {
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
class SVGPathCommand {
    static var m:String = "m"/*Move*/
    static var l:String = "l"/*Line*/
    static var c:String = "c"/*Cubic-Curve*/
    static var s:String = "s"/*smooth Cubic curve command*/
    static var q:String = "q"/*Quad-curve*/
    static var t:String = "t"/*smooth quadratic curve command*/
    static var a:String = "a"/*Arc*/
    static var h:String = "h"/*Horizontal*/
    static var v:String = "v"/*Vertical*/
    static var z:String = "z"/*Return to last Move*/
}

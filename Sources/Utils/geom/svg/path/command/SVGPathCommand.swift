import Foundation
/**
 * The SVG commands represented here are from the official SVG syntax
 * TODO: Great candidate for enum 👌
 */
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
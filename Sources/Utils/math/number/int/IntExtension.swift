import Foundation
/**
 * Don't add Int.init code that auto casts. like: let i:Int = 40.5//40 via ExpressibleByFloatLiteral and FloatLiteralType. It will accidentally break I.E Animator.swift
 */
extension Int {
    var cgFloat:CGFloat {return CGFloat(self)}/*Convenince*/
    var float:Float {return Float(self)}/*Convenince*/
    var string:String{return String(self)}/*Convenince*/
    var double:Double {return Double(self)}/*Convenince*/
    var uint32:UInt32 {return UInt32(self)}/*Convenince*/
    func minMax(_ min:Int,_ max:Int)->Int{return NumberParser.minMax(self, min, max)}/*Convenince*/
    func clip(_ min:Int,_ max:Int)->Int{return NumberParser.clip(self, min, max)}/*Convenince*/
    var negative:Bool{return NumberAsserter.negative(self,0)}
    var positive:Bool{return NumberAsserter.positive(self,0)}
}

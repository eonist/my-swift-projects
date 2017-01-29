import Foundation

extension Int {
    var cgFloat:CGFloat {return CGFloat(self)}/*Convenince*/
    var float:Float {return Float(self)}/*Convenince*/
    var string:String{return String(self)}/*Convenince*/
    var double:Double {return Double(self)}/*Convenince*/
    func minMax(_ min:Int,_ max:Int)->Int{return NumberParser.minMax(self, min, max)}/*Convenince*/
    func clip(_ min:Int,_ max:Int)->Int{return NumberParser.clip(self, min, max)}/*Convenince*/
    var negative:Bool{return NumberAsserter.negative(self)}
    var positive:Bool{return NumberAsserter.positive(self)}
}

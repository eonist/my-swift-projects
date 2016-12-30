import Foundation

extension Int {
    var cgFloat:CGFloat {return CGFloat(self)}//Convenince
    var float:Float {return Float(self)}//Convenince
    var string:String{return String(self)}//Convenince
    var double:Double {return Double(self)}//Convenince
    func minMax(min:Int,_ max:Int)->Int{return NumberParser.minMax(self, min, max)}//Convenince
    var negative:Bool{return IntAsserter.negative(self)}
    var positive:Bool{return IntAsserter.positive(self)}
}
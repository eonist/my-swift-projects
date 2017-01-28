import Foundation

var NaN:CGFloat = CGFloat.nan/*Global variable for the sake of convenience*/

extension CGFloat {
    func toFixed(_ places:Int)->CGFloat{return CGFloatModifier.toFixed(self, places)}
    func isNear(_ value:CGFloat,_ epsilon:CGFloat)->Bool{return CGFloatAsserter.isNear(self, value, epsilon)}
    var uint:UInt{return UInt(self)}
    var int:Int{return Int(self)}
    var float:Float{return Float(self)}
    var string:String{return String(describing: self)}
    var isNegative:Bool{return NumberAsserter.negative(self)}
    var isPositive:Bool{return NumberAsserter.positive(self)}
    func clip(_ min:CGFloat,_ max:CGFloat)->CGFloat{return NumberParser.clip(self, min, max)}/*Convenince*/
    func interpolate(_ to:CGFloat, _ fraction:CGFloat) -> CGFloat{return CGFloatParser.interpolate(self,to,fraction)}
}
/**
 * Swift 3 removed the possibility to cast CGFloat to Bool This method brings back this functionality.
 * JUSTIFICATION: Most other languages allow this functionality, and is familiar to the user the alternative is verbose code. Which makes code cognitively harder to read.
 * NOTE: Bool(Int(1)) still works natively
 * EXAMPLE: (expected results from other languages)
 * Bool(CGFloat(0))//false
 * Bool(CGFloat(-2))//true
 * Bool(CGFloat(20))//true
 * Bool(CGFloat.nan)//true
 */
extension Bool{
    init(_ value:CGFloat) {
        self.init(value != 0)
    }
}
/**
 * Support for addition of CGFLoat and Double
 * TODO: probably use T or Generics or similar
 * TODO: add support for returning Double aswell
 * TODO: add support for Int and Float aswell
 */
public func + (left: CGFloat, right: Double) -> CGFloat {
    return left + CGFloat(right)
}
/**
 * Support for addition of CGFLoat and Double
 */
public func + (left: Double, right: CGFloat) -> CGFloat {
    return CGFloat(left) + right
}
public func * (left: Int, right: CGFloat) -> CGFloat {
    return CGFloat(left) * right
}
public func * (left: CGFloat, right: Int) -> CGFloat {
    return left * CGFloat(right)
}
infix operator %%/*<--infix operator is required for custom infix char combos*/
/**
 * Brings back simple modulo syntax (was removed in swift 3)
 * Calculates the remainder of expression1 divided by expression2
 * The sign of the modulo result matches the sign of the dividend (the first number). For example, -4 % 3 and -4 % -3 both evaluate to -1
 * EXAMPLE: 
 * print(12 %% 5)    // 2
 * print(4.3 %% 2.1) // 0.0999999999999996
 * print(4 %% 4)     // 0
 * NOTE: The first print returns 2, rather than 12/5 or 2.4, because the modulo (%) operator returns only the remainder. The second trace returns 0.0999999999999996 instead of the expected 0.1 because of the limitations of floating-point accuracy in binary computing.
 */
public func %% (left:CGFloat, right:CGFloat) -> CGFloat {
    return left.truncatingRemainder(dividingBy: right)
}

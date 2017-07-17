import Foundation
/**
 * Definition of Asserter: state a fact or belief confidently and forcefully
 * TODO: Rename this to CGFloatAsserter, and then make a typeAlias to NumberAsserter -> to not break legacy code. (Do the same with PointAserter etc)
 */
class CGFloatAsserter{
    static let epsilon:CGFloat = 10e-12
    /**
     * RETURN: true if number is odd
     * EXAMPLE:
     * print(NumberAsserter.odd(0));//false
     * print(NumberAsserter.odd(1));//true
     * print(NumberAsserter.odd(2));//false
     * print(NumberAsserter.odd(3));//true
     * print(NumberAsserter.odd(4));//false
     */
    static func odd(_ number:CGFloat)->Bool {
        return (number %% 2) != 0.0
    }
    /**
     * EXAMPLE: event(0),even(2),even(4)
     */
    static func even(_ number:CGFloat)->Bool{
        return !odd(number)
    }
    /**
     * NOTE: I think this could be written simpler: Math.abs(a - b) <= epsilon, test different cases to verify, only would it work with negative values as the current method does?
     * EXAMPLE: print(NumberAsserter.isNear(-1.8650465545944293 , -1.8650465545944273, NumberAsserter.EPSILON));//true, result is 10e-15 which is less than 10e-12
     */
    static func isNear(_ a:CGFloat,_ b:CGFloat,_ epsilon:CGFloat)->Bool {//this could also be named almostEqual
        if(a == b){ return true}
        else{
            let result:CGFloat = Swift.max(a, b) - Swift.min(a, b)
            return result < epsilon//TODO: we could do <= here
        }
    }
    /**
     * UnLike isNear, this returns true for cases where the value is within epsilon and on epsiolon, see examples bellow:
     * NOTE: The computation is also simpler and faster
     * EXAMPLE: near(40,50,10)//true
     * EXAMPLE: near(-40,-50,10)//true
     * EXAMPLE: near(-10,0,10)//true
     * EXAMPLE: near(10,0,10)//true
     * EXAMPLE: near(-60,-50,10)//true
     */
    static func near(_ a:CGFloat,_ b:CGFloat,_ epsilon:CGFloat) -> Bool{
        return abs(a - b) <= epsilon
    }
    /**
     * NOTE: unlike the native "==" method this method supports NaN values
     */
    static func equals(_ a:CGFloat,_ b:CGFloat) -> Bool {
        return (a.isNaN && b.isNaN) || a == b
    }
    /**
     * NOTE: you can also use Number.NEGATIVE_INFINITY and Number.POSITIVE_INFINITY
     */
    static func isInfinity(_ number:CGFloat) -> Bool {
        return number == CGFloat.infinity || number == -CGFloat.infinity
    }
}

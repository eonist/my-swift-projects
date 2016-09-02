import Foundation
/**
 * Definition of Asserter: state a fact or belief confidently and forcefully
 * TODO: Rename this to CGFloatAsserter, and then make a typeAlias to NumberAsserter -> to not break legacy code. (Do the same with PointAserter etc)
 */
class NumberAsserter{
    /**
     * @Note: In most cases you will want to write if(someNumber < 0)
     */
    class func negative(number:CGFloat)->Bool {
        return number < 0;
    }
    /**
     * @Note: In most cases you will want to write if(someNumber >
     */
    class func positive(number:CGFloat)->Bool {
        return number > 0;
    }
    /**
     * print(NumberAsserter.isNear(-1.8650465545944293 , -1.8650465545944273, NumberAsserter.EPSILON));//true, result is 10e-15 which is less than 10e-12
     * NOTE: i think this could be written simpler: Math.abs(a - b) <= epsilon, test different cases to verify
     */
    class func isNear(a:CGFloat,_ b:CGFloat,_ epsilon:CGFloat)->Bool {//this could also be named almostEqual
        if(a == b){ return true}
        else{
            let result:CGFloat = Swift.max(a, b) - Swift.min(a, b)
            //print("result: " + "\(result)");
            return result < epsilon//TODO: we could do <= here
        }
    }
    /**
     *
     */
    class func near(a:CGFloat,_ b:CGFloat,_ epsilon:CGFloat) -> Bool{
        return abs(a - b) <= epsilon
    }
    /**
     * @Note unlike the native "==" method this method supports NaN values
     */
    class func equals(a:CGFloat,_ b:CGFloat) -> Bool {
        return (a.isNaN && b.isNaN) || a == b
    }
    /**
     * @Note you can also use Number.NEGATIVE_INFINITY and Number.POSITIVE_INFINITY
     */
    class func isInfinity(number:CGFloat) -> Bool {
        return number == CGFloat.infinity || number == -CGFloat.infinity
    }
}
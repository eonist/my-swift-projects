import Foundation
/**
 * Definition of Asserter: state a fact or belief confidently and forcefully
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
}
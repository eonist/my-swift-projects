import Foundation
class NumberAsserter{
    /**
     * NOTE: In most cases you will want to write if(someNumber < 0)
     */
    static func negative<T:Comparable>(_ number:T,_ zero:T) -> Bool{
        return number < zero
    }
    /**
     * NOTE: In most cases you will want to write if(someNumber >
     * TODO: to avoid zero, we could pass zero to an internal private static method that then returns true or false
     */
    static func positive<T:Comparable>(_ number:T , _ zero:T) -> Bool {
        return number > zero
    }
}

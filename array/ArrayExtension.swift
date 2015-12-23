import Foundation
/*

Needs more research

extension Array where Element:String{
    /**
     *
     */
    func join(seperator:String)->String{
        return StringModifier.combine(self as! Array<String>,seperator)
    }
}
*/

extension Array {
    /**
     * Removes the first item in an array
     * Shift
     * var a = ["a","b","c"]
     * Swift.print("a.shift(): " + "\(a.shift())")//a
     * Swift.print("a: " + "\(a)")//b,c
     */
    mutating func shift(/*x:[Element]*/) ->Element{
        return ArrayModifier.shift(&self)
    }
}
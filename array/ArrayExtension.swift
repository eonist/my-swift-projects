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
    mutating func slice(/*x:[Element]*/) ->Element{
        return ArrayModifier.slice(&self)
    }
}

/*
/**
* Returns a new array derived from the @param array sans the items from @param start to @param end
* IMPORTANT: the original array is NOT modified
* slice(["spinach","green pepper","cilantro","onion","avocado"],1, 3)// "spinach","onion","avocado"
*/
class func slice<T>(var array:[T],_ startIndex:Int, _ endIndex:Int)->Array<T>{
let deleteCount = endIndex - startIndex
array.removeRange(Range<Int>(start:Int(startIndex),end:Int(startIndex + deleteCount)))
return array
}
*/
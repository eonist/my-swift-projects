import Foundation
class ArrayAsserter {
    /**
     * Asserts if the items in @param a is also present in the array @param b
     * @param a: an array of items to check if is apart of the @param b
     * @param b: the array to check against
     * @param strict: toggle the ability that the items must be equal to the array, (almost the same functionality as the isEqual function, although equal function the array must have the same order)
     * @return: a boolean indicating if the items is apart of the array
     * EXAMPLE: ArrayAsserter.contains([1,2,3], [1,2], false)//true
     * EXAMPLE: ArrayAsserter.contains([1,2,3], [1,2], true)//false, the length of a and b must be the same
     * TODO: create a better description
     * NOTE: one can also use the similar native method: array.contains(obj)
     * NOTE: This method compares if the instance has the same variables, it does not compare if the instance has the same referene point, which may be suitable in some situations, maybe make a method for this?
     */
    class func contains<T:Equatable>(a:[T], _ b:[T], _ strict:Bool = false)->Bool {
        var score:Int = 0;
        for (var i:Int = 0 , n:Int = a.count ;i < n ;i++) {if (b.indexOf(a[i]) >= 0 ){ score++ }}
        return score == (strict ? b.count:a.count)
    }
    /**
     * Asserts if an array has an item
     * NOTE: Determines whether the specified array contains the specified value
     * NOTE: Only works with Equatable types
     * @param arr The array that will be checked for the specified value.
     * @param value The object which will be searched for within the array
     * @return True if the array contains the value, False if it does not.
     * @EXAMPLE: Swift.print(ArrayAsserter.has(["e","f","g"], "f"))//true
     * @EXAMPLE: Swift.print(ArrayAsserter.has(["e","f","g"], "a"))//false
     */
    class func has<T : Equatable>(arr : [T], _ value:T)->Bool {//the <T: Equatable> part ensures that the types can use the equal operator ==
        return ArrayParser.index(arr, value) != -1
    }
    /**
     * New
     * IMPORTANT: use none optional variables in the PARAM: arr and the PARAM: item
     */
    class func has<T>(arr:[T],_ item:T) -> Bool{
        return ArrayParser.indx(arr, item) != -1
    }
}
import Foundation
class ArrayAsserter {
    /**
     * Asserts if the items in PARAM: a is also present in the array PARAM: b
     * PARAM: a: an array of items to check if is apart of the PARAM: b
     * PARAM: b: the array to check against
     * PARAM: strict: toggle the ability that the items must be equal to the array, (almost the same functionality as the isEqual function, although equal function the array must have the same order)
     * RETURNS: a boolean indicating if the items is apart of the array
     * NOTE: one can also use the similar native method: array.contains(obj)
     * NOTE: This method compares if the instance has the same variables, it does not compare if the instance has the same referene point, which may be suitable in some situations, maybe make a method for this?
     * EXAMPLE: ArrayAsserter.contains([1,2,3], [1,2], false)//true
     * EXAMPLE: ArrayAsserter.contains([1,2,3], [1,2], true)//false, the length of a and b must be the same
     */
    static func contains<T:Equatable>(_ a:[T], _ b:[T], _ strict:Bool = false)->Bool {
        var score:Int = 0
        a.forEach{ x in
            if b.index(of: x) != nil {
                score += 1
            }
        }
        return score == (strict ? a.count : b.count)
    }
    /**
     * Asserts if an array has an item
     * NOTE: Determines whether the specified array contains the specified value
     * NOTE: Only works with Equatable types
     * PARAM: arr: The array that will be checked for the specified value.
     * PARAM: value: The object which will be searched for within the array
     * RETURN: True if the array contains the value, False if it does not.
     * EXAMPLE: Swift.print(ArrayAsserter.has(["e","f","g"], "f"))//true
     * EXAMPLE: Swift.print(ArrayAsserter.has(["e","f","g"], "a"))//false
     */
    static func has<T>(_ arr : [T], _ value:T)->Bool where T:Comparable {//the <T: Equatable> part ensures that the types can use the equal operator ==
        return ArrayParser.index(arr, value) != -1
    }
    /**
     * IMPORTANT: ⚠️️ use none optional variables in the PARAM: arr and the PARAM: item
     * NOTE: Works by comparing references, not values. Use the other has method if you want to compare value.
     */
    static func has<T>(_ arr:[T],_ item:T) -> Bool{
        return ArrayParser.indx(arr, item) != -1
    }
    /**
     * EXAMPLE: ["a","b","c"].has("b",{$0 == $1})//true
     */
    static func has<T,V>(_ variables:[T],_ match:V,_ method:@escaping (T,V)->Bool) -> Bool  where V:Equatable{
        return ArrayParser.first(variables, match, method) != nil
    }
    /**
     * Asserts if two arrays are identical, a boolean is returned depending on the equality of two arrays (must be in the same order)
     * PARAM a: Array to be compared with
     * PARAM b: Array to be compared against
     * RETURN: a boolean indicating if the arrays are equal
     * NOTE: could also be named isEqual,isIdentical
     * IMPORTANT: This method compares reference not value
     */
    static func equals<T>(_ a:[T], _ b:[T]) -> Bool{
        if a.count != b.count  { return false }
        for i in 0..<a.count{
            if (a[i] as AnyObject) !== (b[i] as AnyObject) {
                return false
            }
        }
        return true
    }
    /**
     * Asserts if two arrays are identical, a boolean is returned depending on the equality of two arrays (must be in the same order)
     * NOTE: same as the other equals method but asserts value and not reference
     * NOTE: This method has support for both Equatable and Comparable aswell, similar to Array.index, the equatable part enables support for numeric types and the comparable part enables support for string types
     * NOTE: there are two methods named equals in this class, the correct one will be infered from the POV of the callee
     * IMPORTANT: This method compares value not reference
     * EXAMPLE: ArrayAsserter.equals(["",""], ["","",""])//false
     * EXAMPLE: ArrayAsserter.equals([1,2], [1,2])//true
     * TODO: create add this method to ArrayExtensions
     */
    static func equals<T>(_ a:[T], _ b:[T]) -> Bool where T:Comparable{
        if a.count != b.count { return false }
        for i in 0..<a.count{
            if a[i] != b[i] {return false}
        }
        return true
    }
    /**
     * Asserts if an item is at or before PARAM: idx
     * NOTE: Usefull in conjunction with ArrayModifier.insertAt()// to assert if an item already exists at that idx or not. to avoid dups
     */
    static func existAtOrBefore<T>(_ arr:[T],_ idx:Int, _ item:T) -> Bool where T:Equatable{
        func itemAlreadyExistAtIdx()->Bool {return (arr.valid(idx) && arr[idx] == item) }
        func itemExistsAtIdxBefore()->Bool {return (arr.valid(idx-1) && arr[idx-1] == item)}
        return itemAlreadyExistAtIdx() || itemExistsAtIdxBefore()
    }
    /**
     * Asserts if a variable is an Array
     */
    static func isArr(arr:Any) -> Bool{
        return arr is AnyArray
    }
}

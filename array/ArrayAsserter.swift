import Foundation
class ArrayAsserter {
    /**
     * Asserts if the items in PARAM: a is also present in the array PARAM: b
     * PARAM: a: an array of items to check if is apart of the PARAM: b
     * PARAM: b: the array to check against
     * PARAM: strict: toggle the ability that the items must be equal to the array, (almost the same functionality as the isEqual function, although equal function the array must have the same order)
     * RETURNS: a boolean indicating if the items is apart of the array
     * EXAMPLE: ArrayAsserter.contains([1,2,3], [1,2], false)//true
     * EXAMPLE: ArrayAsserter.contains([1,2,3], [1,2], true)//false, the length of a and b must be the same
     * NOTE: one can also use the similar native method: array.contains(obj)
     * NOTE: This method compares if the instance has the same variables, it does not compare if the instance has the same referene point, which may be suitable in some situations, maybe make a method for this?
     * TODO: create a better description
     */
    static func contains<T:Equatable>(a:[T], _ b:[T], _ strict:Bool = false)->Bool {
        var score:Int = 0
        for (var i:Int = 0 , n:Int = a.count ;i < n ;i++) {
            if (b.indexOf(a[i]) >= 0 ){
                score++
            }
        }
        return score == (strict ? b.count:a.count)
    }
    /**
     * Asserts if an array has an item
     * NOTE: Determines whether the specified array contains the specified value
     * NOTE: Only works with Equatable types
     * PARAM: arr The array that will be checked for the specified value.
     * PARAM: value The object which will be searched for within the array
     * RETURN: True if the array contains the value, False if it does not.
     * EXAMPLE: Swift.print(ArrayAsserter.has(["e","f","g"], "f"))//true
     * EXAMPLE: Swift.print(ArrayAsserter.has(["e","f","g"], "a"))//false
     */
    static func has<T where T:Equatable, T:Comparable>(arr : [T], _ value:T)->Bool {//the <T: Equatable> part ensures that the types can use the equal operator ==
        return ArrayParser.index(arr, value) != -1
    }
    /**
     * New
     * IMPORTANT: use none optional variables in the PARAM: arr and the PARAM: item
     * NOTE: Works by comparing references, not values. Use the other has method if you want to compare value.
     */
    static func has<T>(arr:[T],_ item:T) -> Bool{
        return ArrayParser.indx(arr, item) != -1
    }
    /**
     * Asserts if two arrays are identical, a boolean is returned depending on the equality of two arrays (must be in the same order)
     * PARAM a: Array to be compared with
     * PARAM b: Array to be compared against
     * RETURN: a boolean indicating if the arrays are equal
     * NOTE: could also be named isEqual,isIdentical
     * IMPORTANT: This method compares reference not value
     */
    static func equals<T>(a:Array<T>, _ b:Array<T>) -> Bool{
        let aLength:Int = a.count
        if(aLength != b.count) { return false }
        for(var i:Int = 0; i < aLength; i++) { if((a[i] as! AnyObject) !== (b[i] as! AnyObject)) {return false}}//Doesn't the !== only work on the same reference, yepp it does. To comapre value create another method
        return true
    }
    /**
     * Asserts if two arrays are identical, a boolean is returned depending on the equality of two arrays (must be in the same order)
     * NOTE: same as the other equals method but asserts value and not reference
     * NOTE: This method has support for both Equatable and Comparable aswell, similar to Array.index, the equatable part enables support for numeric types and the comparable part enables support for string types
     * NOTE: there are two methods named equals in this class, the correct one will be infered from the POV of the callee
     * TODO: create add this method to ArrayExtensions
     * IMPORTANT: This method compares value not reference
     * EXAMPLE: ArrayAsserter.equals(["",""], ["","",""])//false
     * EXAMPLE: ArrayAsserter.equals([1,2], [1,2])//true
     */
    static func equals<T where T:Equatable, T:Comparable>(a:Array<T>, _ b:Array<T>) -> Bool{
        let aLength:Int = a.count
        if(aLength != b.count) { return false }
        for(var i:Int = 0; i < aLength; i++) { if(a[i] != b[i]) {return false}}//Doesnt the !== only work on the same reference, yepp it does. To comapre value create another method
        return true
    }
}
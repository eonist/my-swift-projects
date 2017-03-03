import Foundation
extension Array {
    mutating func shift() ->Element{/*convenience*/
        return ArrayModifier.shift(&self)
    }
    mutating func pop() -> Element?{/*convenience*/
        return ArrayModifier.pop(&self)
    }
    mutating func pushPop(_ item:Element) -> Array<Element>{/*convenience*/
        return ArrayModifier.pushPop(&self, item)
    }
    /**
     * Enables the Array as a varadic method: 
     * NOTE: Variadic functions are functions that have a variable number of arguments (indicated by ... after the argument's type) that can be accessed into their body as an array.
     * CAUTION: renaming appendMany to just append can cause problems with some array's so its probably better to leave it named something different than the native append name
     * EXAMPLE:
     * var arr:Array<Int> = [0,1,2]
     * arr.appendMany(3,4,5)
     * Swift.print(arr)//[0,1,2,3,4,5]
     */
    mutating func appendMany(_ items:Element...){
        self += items
    }
    mutating func splice2(_ startIndex:Int,_ deleteCount:Int,_ values:Array<Element> = [])->Array<Element>{
        return ArrayModifier.splice2(&self, startIndex, deleteCount, values)
    }
    mutating func unshift(_ item:Element)->Int{
        return ArrayModifier.unshift(&self, item)
    }
    mutating func prepend(_ item:Element)->Int{/*the name is more descriptive than unshift, easier to reason about*/
        return ArrayModifier.unshift(&self, item)
    }
    func slice2(_ startIndex:Int, _ endIndex:Int) ->[Element]{/*Convenince*/
        return ArrayModifier.slice2(self,startIndex,endIndex)
    }
    /**
     * NOTE: there is also native: removeAtIndex(index: Int) -> Element
     */
    mutating func removeAt(_ i:Int){
        if(i != -1){_ = self.splice2(i, 1)}/*1 equals, does not exist*/
    }
    /**
     * NOTE: the concat method is not like append. Append adds an item to the original array, concat creates a new array all together. 
     * NOTE: If you need a mutating concatination behaviour use the += operator
     * IMPORTANT: this method was mutating before, but that wasn't the intended behaviour!?!
     */
    func concat(_ array:Array<Element>) -> Array<Element>{
        return self + array
    }
    /**
     * IMPORTANT: this method was mutating before, but that wasn't the intended behaviour!?!
     * NOTE: If you need a mutating concatination behaviour use the += operator
     */
    func concat(_ item:Element) -> Array<Element>{/*Convenince*/
        return concat([item])
    }
    /**
     * A neat way to cast Array's (Since swift/obj-c has made casting array's cumbersome at times)
     * NOTE: figure out a way to make it work with inout methods aswell
     * NOTE: You may also not provide a type and the type will be infered automatically
     * NOTE: You can cast arrays with protocol instances to class types like NSView. (Great way to maintain a protocol based design)
     * CAUTION: using the map method isn't exactly the most optimized way to cast, but sometimes optimizing isnt needed, with small arrays etc, Also sometimes designing around using map can cause you to over design things in code
     */
    func cast<T>(_ type:T.Type? = nil) -> [T]{
        return self.map { $0 as! T }
    }
    mutating func insertAt(_ item:Element, _ index:Int) -> [Element]{//convenience
        return ArrayModifier.insertAt(&self, item, index)
    }
    /**
     * Asserts if PARAM: idx is within the bounds of the array
     */
    func valid(_ idx:Int) -> Bool{
        return self.count > 0 && idx > -1 && idx < self.count
    }
    func first(_ match:Element, _ condition:(_ a:Element, _ b:Element)->Bool)->Element?{
        return ArrayParser.first(self, match, condition)
    }
    func removeDups( _ condition:(_ a:Element, _ b:Element)->Bool)->[Element]{
        return ArrayModifier.removeDups(self, condition)
    }
}
/**
 * NOTE: only applicable to Array<AnyObject>
 */
extension Array where Element:AnyObject{
    func indexOf(_ item:AnyObject)-> Int{
        return ArrayParser.indexOf(self,item)
    }
}
extension Array where Element:Equatable, Element:Comparable{
    func index(value:Element)->Int{
        return ArrayParser.index(self, value)
    }
}
extension Array where Element:Equatable{
    func existAtOrBefore(_ idx:Int, _ item:Element) -> Bool{
        return ArrayAsserter.existAtOrBefore(self, idx, item)
    }
}

protocol AnyArray{}/*<--Neat trick to assert if a value is an Array, use-full in reflection and when the value is Any but really an array*/
extension Array:AnyArray{}//Maybe rename to ArrayType
extension NSArray:AnyArray{}/*<-empty arrays are always NSArray so this is needed*/


/**
 * var arr = [1,2,3] 
 * arr += 4
 * print(arr)//1,2,3,4
 */
public func +=<T> ( left:inout [T], right: T) -> [T] {/*returns array for the sake of convenience*/
    left.append(right)
    return left
}
/**
 * var arr = [2,3,4]
 * 1 += arr
 * print(arr)//1,2,3,4
 */
public func +=<T> (left: T, right:inout [T]) -> [T] {/*returns array for the sake of convenience*/
    _ = right.unshift(left)/*<--this is like prepend*/
    return right
}
/*Advance array extensions*/
extension Collection {
    /**
     * Multidimensional-flat-map...because flatMap only works on "2d arrays". This is for "3d array's"
     * NOTE: A 3d array is an array structure that can have nested arrays within nested arrays infinite addendum
     * NOTE: Alternate names for this method as suggest by @defrenz and @timvermeulen on slack swift-lang #random: `recursiveFlatten` or `recursiveJoined` 
     * EXAMPLE:
     * let arr:[Any] = [[[1],[2,3]],[[4,5],[6]]]👈3d array
     * let x2:[Int] = arr.recursiveFlatmap()
     * Swift.print(x2)//[1,2,3,4,5,6]
     */
    func recursiveFlatmap<T>() -> [T] {
        var results = [T]()
        for element in self {
            if let sublist = element as? [Self.Generator.Element] {
                results += sublist.recursiveFlatmap()
            } else if let element = element as? T {
                results.append(element)
            }
        }
        return results
    }
}

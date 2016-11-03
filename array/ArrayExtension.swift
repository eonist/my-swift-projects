import Foundation
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
    mutating func pop() -> Element?{
        return ArrayModifier.pop(&self)
    }
    mutating func pushPop(item:Element) -> Array<Element>{
        return ArrayModifier.pushPop(&self, item)
    }
    /**
     * Enables the Array as a varadic method: 
     * NOTE: Variadic functions are functions that have a variable number of arguments (indicated by ... after the argument's type) that can be accessed into their body as an array.
     * EXAMPLE:
     * var arr:Array<Int> = [0,1,2]
     * arr.appendMany(3,4,5)
     * Swift.print(arr)//[0,1,2,3,4,5]
     * CAUTION: renaming appendMany to just append can cause problems with some array's so its probably better to leave it named something different than the native append name
     */
    mutating func appendMany(items:Element...){
        self += items
    }
    /**
     * NOTE: the concat method is not like append. Append adds an item to the original array, concat creates a new array all together. 
     * IMPORTANT: this method was mutating before, but that wasn't the intended behaviour!?!
     * NOTE: If you need a mutating concatination behaviour use the += operator
     */
    func concat(array:Array<Element>) -> Array<Element>{
        return self + array
    }
    /**
     * IMPORTANT: this method was mutating before, but that wasn't the intended behaviour!?!
     * NOTE: If you need a mutating concatination behaviour use the += operator
     */
    func concat(item:Element) -> Array<Element>{//Convenince
        return concat([item])
    }
    /**
     * Example: [1,2,3,4].splice(0, 1).count//3
     */
    mutating func splice2(startIndex:Int,_ deleteCount:Int,_ values:Array<Element> = [])->Array<Element>{
        return ArrayModifier.splice2(&self, startIndex, deleteCount, values)
    }
    mutating func unshift(item:Element)->Int{
        return ArrayModifier.unshift(&self, item)
    }
    mutating func prepend(item:Element)->Int{/*the name is more descriptive than unshift, easier to reason about*/
        return ArrayModifier.unshift(&self, item)
    }
    func DEPRECATEDslice(startIndex:Int, _ endIndex:Int) ->Array<Element>{
        return ArrayModifier.DEPRECATEDslice(self,startIndex,endIndex)
    }
    func slice2(startIndex:Int, _ endIndex:Int) ->Array<Element>{
        return ArrayModifier.slice2(self,startIndex,endIndex)
    }
    func index<T where T:Equatable, T:Comparable>(arr : [T], _ value:T)->Int{
        return ArrayParser.index(arr, value)
    }
    /**
     * -1 equals, does not exist
     * NOTE: there is also native: removeAtIndex(index: Int) -> Element
     */
    mutating func removeAt(i:Int){
        if(i != -1){self.splice2(i, 1)}
    }
    
    /**
     * A neat way to cast Array's (Since swift/obj-c has made casting array's cumbersome at times)
     * NOTE: figure out a way to make it work with inout methods aswell
     * NOTE: You may also not provide a type and the type will be infered automatically
     * NOTE: You can cast arrays with protocol instances to class types like NSView. (Great way to maintain a protocol based design)
     * CAUTION: using the map method isn't exactly the most optimized way to cast, but sometimes optimizing isnt needed, with small arrays etc, Also sometimes designing around using map can cause you to over design things in code
     */
    func cast<T>(type:T.Type? = nil) -> [T]{
        return self.map { $0 as! T }
    }
}
/**
 * NOTE: only applicable to Array<AnyObject>
 */
extension Array where Element:AnyObject{
    func indexOf(item:AnyObject)-> Int{
        return ArrayParser.indexOf(self,item)
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
public func +=<T> (inout left:[T], right: T) -> [T] {/*returns array for the sake of convenience*/
    left.append(right)
    return left
}
/**
 * var arr = [2,3,4]
 * 1 += arr
 * print(arr)//1,2,3,4
 */
public func +=<T> (left: T,inout right:[T]) -> [T] {/*returns array for the sake of convenience*/
    right.unshift(left)/*<--this is like prepend*/
    return right
}

//TODO: Needs more research see similar case with AnyObject
/*
extension Array where Element:String{
    /**
     *
     */
    func join(seperator:String)->String{
        return StringModifier.combine(self as! Array<String>,seperator)
    }
    /**
     *
     */
    func indexOfStr(str:String)->Int{
        return ArrayParser.indexOfStr(self,str)
    }
}
*/
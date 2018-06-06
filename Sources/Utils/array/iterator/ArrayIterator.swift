import Foundation
/**
 * EXAMPLE: var arrIterator = ArrayIterator(array:[1,2,3,4,5])
 * while arrIterator.hasNext() {Swift.print(arrIterator.next())}//1,2,3,4,5
 * TODO: ⚠️️ make the ReverseArrayIterator...see notes
 */
class ArrayIterator<T> {
    var index:Int = 0
    var collection:Array<T>
    init(array:Array<T>){
        self.collection = array
    }
    func hasNext() -> Bool{
        return index < collection.count
    }
    /**
     * Returns current item
     */
    func next() -> T{
        let retVal = collection[index]//cur item
        index += 1
        return retVal
    }
    func reset(){
        index = 0
    }
}
extension ArrayIterator:Iteratable{}

//let arrIterator = ArrayIterator(array:[1,2,3,4,5])
//        while arrIterator.hasNext() {
//            Swift.print(arrIterator.next())
//        }

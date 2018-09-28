import Foundation

class ReverseArrayIterator<T>:ArrayIterator<T> {
    func hasPrev() -> Bool{
        return index > 0
    }
    /**
     * Returns prev item
     */
    func prev() -> T{
        index -= 1
        let retVal = collection[index]/*cur item*/
        return retVal
    }
}
extension ReverseArrayIterator:Reversable{}



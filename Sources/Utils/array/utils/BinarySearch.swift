import Foundation

class BinarySearch{
    /**
     * Finds a correct index to insert an item at
     * EXAMPLE: let key = 11
     * EXAMPLE: var numbers = [9,15,91]
     * EXAMPLE: let idx = binaryIndex(numbers,key,0,numbers.count)//1
     * EXAMPLE: if idx >= numbers.count || numbers[idx] != key {numbers.insert(key, at: idx)}
     * EXAMPLE: print(numbers)//[9,11,15,91]
     * NOTE: we use a closure because protocols can't have comparable
     * TODO: ⚠️️ Try to get rid of the closure by using Element and Collection. See the Array types.
     */
    typealias BinaryIndexClosure = (Any) -> Int
    static func binaryIndex<T>(_ arr:[T], i:T, start:Int, end:Int, closure:BinaryIndexClosure = {$0 as! Int}) -> Int{//the closure works if T is Int
        if start == end {
            return start//i doesn't exist, this is the closest at: \(start)
        }
        let mid:Int = start + ((end - start) / 2)/*start + middle of the distance between start and end*/
        if closure(i) < closure(arr[mid]){/*index is in part1*/
            return binaryIndex(arr,i:i,start:start,end:mid,closure:closure)
        }else if closure(i) > closure(arr[mid]) {/*index is in part2*/
            return binaryIndex(arr,i:i,start:mid+1,end:end,closure:closure)
        }else{/*index is at middleIndex*/
            return mid
        }
    }
    /*
     * NOTE: Binary search does not find an index if the key you search for is not present in the array
     * EXAMPLE: let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
     * EXAMPLE: binarySearch(numbers, key: 43, range: 0 ..< numbers.count)//output: 13 index of where the key is
     */
    static func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            return nil// If we get here, then the search key is not present in the array.
        }else{
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2// Calculate where to split the array.
            if a[midIndex] > key {// Is the search key in the left half?
                return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
            }else if a[midIndex] < key {// Is the search key in the right half?
                return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            }else {// If we get here, then we've found the search key!
                return midIndex
            }
        }
    }
}

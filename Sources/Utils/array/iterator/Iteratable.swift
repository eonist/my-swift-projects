import Foundation
/**
 * TODO: ⚠️️ Why are we using a method for the hasNext call?
 */
protocol Iteratable {
    associatedtype T
    var index: Int { get set }/*The iteration cursor*/
    var collection: Array<T> { get set }
    func hasNext() -> Bool
    func next() -> T
    func reset()
}

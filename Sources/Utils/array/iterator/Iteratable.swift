import Foundation

protocol Iteratable {
    associatedtype T
    var index:Int {get set}/*The iteration cursor*/
    var collection:Array<T> {get set}
    func hasNext() -> Bool
    func next() -> T
    func reset()
}


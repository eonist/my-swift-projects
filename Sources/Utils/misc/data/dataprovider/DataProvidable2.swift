import Foundation

protocol DataProvidable2{
    associatedtype argType
    typealias DPType = [String:argType]
    func item(at:Int) -> DPType?
    var count:Int{get}
}

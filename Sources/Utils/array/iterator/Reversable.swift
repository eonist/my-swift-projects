import Foundation
/**
 * TODO: ⚠️️ alt name could be ReverseIteratable 👈  next
 */
protocol Reversable:Iteratable {
    func hasPrev() -> Bool
    func prev() -> T
}


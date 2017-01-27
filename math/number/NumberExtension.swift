import Foundation

extension Array where Element:Equatable, Element:Comparable{
    func index(value:Element)->Int{
        return ArrayParser.index(self, value)
    }
}

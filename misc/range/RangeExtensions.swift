import Foundation
/**
 * EXAMPLE: Range(start:2,end:6).count//4
 */
extension Range {
    var start:Element {return self.startIndex}/*convenince*/
    var end:Element {return self.endIndex}/*convenince*/
    var length:Element.Distance {return self.count}/*convenince*/
    init(_ start:Element,_ end:Element){/*Conveninence initializer*/
        self.init(start:start,end:end)
    }
}
extension Range where Element : Comparable {
    func edge<T:Comparable>(index:T)->Bool{
        return RangeAsserter.edge(index, self)
    }
}

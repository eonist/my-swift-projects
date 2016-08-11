import Foundation
/**
 * EXAMPLE: Range(start:2,end:6).count//4
 * TODO: Figure out how to write extensions for Range that also works with RangeAsserter etc
 */
extension Range {
    var start:Element {return self.startIndex}/*convenince*/
    var end:Element {return self.endIndex}/*convenince*/
    var length:Int {return self.endIndex - self.startIndex}/*convenince*/
    init(_ start:Element,_ end:Element){/*Conveninence initializer*/
        self.init(start:start,end:end)
    }
}
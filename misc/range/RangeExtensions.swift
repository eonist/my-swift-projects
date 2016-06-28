import Foundation

extension Range {
    var start:Element {return self.startIndex}/*convenince*/
    var end:Element {return self.endIndex}/*convenince*/
    init(_ start:Element,_ end:Element){/*Conveninence initializer*/
        self.init(start:start,end:end)
    }
}
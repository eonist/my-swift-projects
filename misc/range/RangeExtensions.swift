import Foundation

extension Range {
    var start:Element {return self.startIndex}
    var end:Element {return self.endIndex}
    init(_ start:Element,_ end:Element){
        self.init(start:start,end:end)
    }
}

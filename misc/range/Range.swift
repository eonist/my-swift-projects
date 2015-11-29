import Foundation

class Range<T> {
    var start:T
    var end:T
    init(start : T, end : T) {
        self.start = start;
        self.end = end;
    }
}
extension Range{
    func within(range:Range,number:T)->Bool {
        return false//(number <= RangeParser.max(range) && number >= RangeParser.min(range));
    }
}

/*

class Tree <T> {

// 'T' can now be used as a type
var value : T

var children : [Tree <T>] = []

init(value : T) {
self.value = value
}

func addChild(value : T) -> Tree <T> {”

let newChild = Tree<T>(value: value)
children.append(newChild)
return newChild
}
}

// Tree of integers
let integerTree = Tree<Int>(value: 5)

*/
import Foundation

class Range<T> {
    var start:T
    var end:T
    init(start : T, end : T) {
        self.start = start;
        self.end = end;
    }
}

import Foundation

class Month {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func shortened() -> String {
        return name[name.startIndex..<advanceBy(name.startIndex, 3)]
    }
}
/**
*
*/
func test(){
    print(Month(name: "January").shortened())    // Jan
}

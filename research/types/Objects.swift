import Foundation

class Month {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    /*
     * Used to be just: //return name[name.startIndex..<advance(name.startIndex, 3)]
     */
    func shortened() -> String {
        let startIndex = name.startIndex.advancedBy(0)
        let endIndex = name.startIndex.advancedBy(3)
        let range:Range = Range(start:startIndex,end:endIndex)
        return name.substringWithRange(range)
    }
}
/**
*
*/
func test(){
    print(Month(name: "January").shortened())    // Jan
}

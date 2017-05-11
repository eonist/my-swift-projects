import Foundation

class Parser {
    static func test(){
        let toMatch:String = "b"
        switch Letters(rawValue:toMatch) {
            case .some(.a) : print("a")
            case .some(.b) : print("b")
            case .none: fatalError("type not supported \(toMatch)")
        }

    }
}

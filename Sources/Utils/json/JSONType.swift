import Foundation

enum JSONType {
    case arr
    case int
    case dict
    case dictArr/*An array of dictionaries*/
    case str
}
extension JSONType{
    static func type(_ json:Any?) -> JSONType{
        switch true{
            case JSONAsserter.isStr(json):
                return .str
            case JSONAsserter.isInt(json):
                return .int
            case JSONAsserter.isDict(json):
                return .dict
            case JSONAsserter.isDictArr(json):
                return .dictArr
            case JSONAsserter.isArr(json):
                return .arr
            default:
                fatalError("type not supported: \(type(of:json))")
                break;
        }
    }
}

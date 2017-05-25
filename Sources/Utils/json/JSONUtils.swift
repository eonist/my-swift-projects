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
class JSONParser{
    static func arr(_ json:Any?)->[Any]?{
        return json as? [Any]
    }
    static func dict(_ json:Any?)->[String: Any]?{
        return json as? [String: Any]
    }
    static func int(_ json:Any?)->Int?{
        return json as? Int
    }
    static func str(_ json:Any?)->String?{
        return json as? String
    }
    static func dictArr(_ json:Any?)->[[String:Any]]?{
        return json as? [[String:Any]]//array with dict
    }
}
class JSONAsserter{
    static func isDict(_ json:Any?) -> Bool{
        return JSONParser.dict(json) != nil
    }
    static func isArr(_ json:Any?) -> Bool{
        return JSONParser.arr(json) != nil
    }
    static func isDictArr(_ json:Any?) -> Bool{
        return JSONParser.dictArr(json) != nil
    }
    static func isStr(_ json:Any?) -> Bool{
        return JSONParser.str(json) != nil
    }
    static func isInt(_ json:Any?) -> Bool{
        return JSONParser.int(json) != nil
    }
}

class JSONUtils{
    static func describe(_ json:Any?){
        if let str = JSONParser.str(json){
            Swift.print("Str: \(str)")
        }else if let int = JSONParser.int(json){
            Swift.print("Int: \(int)")
        }else if let dict = JSONParser.dict(json) {
            Swift.print("Dict.count: " + "\(dict.count)")
            dict.forEach { key,value in
                Swift.print("key: \(key)")
                describe(value)
            }
        }else if let arr = JSONParser.arr(json) {
            Swift.print("Arr.count: " + "\(arr.count)")
            arr.forEach{ child in
                describe(child)
            }
        }else{
            fatalError("type not supported: \(type(of:json)) type \(JSONType.type(json))")
        }
    }
}

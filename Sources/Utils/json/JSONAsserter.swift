import Foundation

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

import Foundation

class JSONUtils{
    /**
     *
     */
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
            fatalError("Type not supported: \(type(of:json)) type \(JSONType.type(json))")
        }
    }
}

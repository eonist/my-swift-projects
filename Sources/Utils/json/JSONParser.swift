import Foundation

/**
 * NOTE: See TreeConverter.tree(json) for how you can convert json into data object you can more easily traverse, you can then do JSON -> Tree -> XML
 * TODO: ⚠️️You can also look at the XML classes and reflection classes for how to make more json <-> convert methods
 */
class JSONParser{
    /**
     * Array with any
     */
    static func arr(_ json:Any?)->[Any]?{
        return json as? [Any]
    }
    /**
     * Dict
     * EXAMPLE: JSONParser.dict("{\"title\":\"doctor\"}".json)["title"] //Output: doctor
     * TODO: ⚠️️ use generics on this. See DictParser etc
     */
    static func dict(_ json:Any?)->[String: Any]?{
        return json as? [String: Any]
    }
    /**
     * Int
     */
    static func int(_ json:Any?)->Int?{
        return json as? Int
    }
    /**
     * String
     */
    static func str(_ json:Any?)->String?{
        return json as? String
    }
    /**
     * Array with dict
     * EXAMPLE: JSONParser.dictArr("[{\"title\":\"doctor\"}]".json)?.forEach{print("\(JSONParser.dict($0)?["title"])")} //doctor
     */
    static func dictArr(_ json:Any?)->[[String:Any]]?{
        return json as? [[String:Any]]//array with dict
    }
    /**
     * Converts json string to json object
     * "{\"title\":\"doctor\"}".json //Output: a JSON object
     */
    static func json(_ str:String) -> Any?{
        guard let data:Data = str.data(using: String.Encoding.utf8, allowLossyConversion: false) else{return nil}
        if let json:Any = try? JSONSerialization.jsonObject(with: data, options: []) {
            return json
        }else {
            fatalError("JSON is format wrongly: \(str)")
        }
    }
    /**
     * Dictionary -> "JSON string"
     * NOTE: the opposite of this is: let decoded = try JSONSerialization.jsonObject(with: jsonData, options: []);if let dictFromJSON = decoded as? [String:String] {}
     * NOTE: If key is of type int, use recursion or reflection
     * EXAMPLE: JSONParser.str( ["2": "B", "1": "A", "3": ["1":true]])
     */
    static func str<Key, Value>(dict: [Key: Value]) -> String?{
        do {
            let jsonData:Data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)// here "jsonData" is the dictionary encoded in JSON data
//            Swift.print("jsonData.stringValue: " + "\(jsonData.stringValue)")
            return jsonData.stringValue
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

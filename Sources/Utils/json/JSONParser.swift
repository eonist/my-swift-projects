import Foundation

/**
 * NOTE: See TreeConverter.tree(json) for how you can convert json into data object you can more easily traverse, you can then do JSON -> Tree -> XML
 * TODO: ⚠️️ You can also look at the XML classes and reflection classes for how to make more json <-> convert methods
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
            //Swift.print("data: " + "\(data)")
            fatalError("JSON is format wrongly: \(str)")
            //return nil
        }
        
    }
}

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
     */
    static func dictArr(_ json:Any?)->[[String:Any]]?{
        return json as? [[String:Any]]//array with dict
    }
    /**
     * New
     */
    static func json(_ str:String) -> Any?{
        guard let data:Data = str.data(using: String.Encoding.utf8, allowLossyConversion: false) else{return nil}
        let json:Any? = try? JSONSerialization.jsonObject(with: data, options: [])
        return json
    }
}

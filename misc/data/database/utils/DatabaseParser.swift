import Foundation

class DatabaseParser {
    /**
     *
     */
    class func childAt(db:Database,_ index:Array<Int>)->NSXMLElement?{
        return XMLParser.childAt(db.xml, index)
    }
    /**
     * Returns a key/value object with the attributes at the @param index in @param database
     * @example: DatabaseParser.attributesAt(database,[0,0])["title"]
     */
    class func attributesAt(db:Database, _ index:Array<Int>) -> [String:String]?{// :TODO: rename to objAt?
        let xml:NSXMLElement? = childAt(db,index)
        return xml != nil ? XMLParser.attribs(xml!) : nil
    }
    /**
     * Returns a value of an attribute at @param index in @param database by the key @param name
     * @Note: undefined is returned if attribute does not exist
     */
    class func attributeAt(db:Database, _ index:Array<Int>,_ key:String) -> String?{
        return attributesAt(db, index)?[key]
    }
}

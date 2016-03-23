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
    class func attributesAt(db:Database, _ index:Array<Int>) -> [[String:String]]?{// :TODO: rename to objAt?
        var xml:NSXMLElement? = childAt(db,index)
        return xml != nil ? XMLParser.attributes(xml) : nil
    }
}

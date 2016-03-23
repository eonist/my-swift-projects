import Foundation

class DatabaseParser {
    /**
     *
     */
    class func childAt(db:Database,index:Array<Int>)->NSXMLElement?{
        return XMLParser.childAt(db.xml, index)
    }
}

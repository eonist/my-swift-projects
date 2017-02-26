import Foundation

public class XMLModifier {
    /**
     * Adds PARAM: child to PARAM: xml at an array index PARAM: index
     * // :TODO: needs some refactoring can we use hasComplexContent as an asserter? research
     */
    static func addChildAt(_ xml:XML,_ index:[Int],_ child:XML) -> XML {// :TODO: rename to addAt?
        Swift.print("index: " + "\(index)")
        let i = index.slice2(0,index.count-1)
        Swift.print("i: " + "\(i)")
        let parent:XML? = XMLParser.childAt(xml, i)
        //Swift.print("parent: " + "\(parent)")
        Swift.print("parent?.childCount: " + "\(parent!.childCount)")
        let lastIdx:Int = index.count-1
        Swift.print("lastIdx: " + "\(lastIdx)")
        let insertAt:Int = index[lastIdx]
        Swift.print("insertAt: " + "\(insertAt)")
        _ = parent!.addAt(child,insertAt)
        return xml
    }
    /**
     *
     */
    static func addChildAt(_ xml:XML,_ child:XML,_ index:Int) -> XML {
        return insertAt(xml,index,child)
    }
    /**
     * Inserts PARAM child at PARAM index in PARAM xml
     * NOTE: works similarly to the sprite.addChildAt() function
     */
    static func insertAt(_ xml:XML,_ index:Int,_ child:XML) -> XML {
        xml.insertChild(child, at: index)
        return xml
    }
    /**
     * EXAMPLE XMLModifier.removeChildAt(xml, [0,0]);
     */
    static func removeChildAt(_ xml:XML,_ index:Array<Int>) -> XML {// :TODO: remove may need to be recursive, rename to removeAt?
        //let match:XML = XMLParser.childAt(xml, index)!
        let lastIdx:Int = index[index.count-1]
        Swift.print("lastIdx: " + "\(lastIdx)")
        let parentIdx:[Int] = index.slice2(0,index.count-1)
        Swift.print("parentIdx: " + "\(parentIdx)")
        return XMLParser.childAt(xml, parentIdx)!.removeAt(lastIdx)
        //return match
    }
    /**
     * Convenince
     */
    static func removeChildAt(_ parent:XML,_ idx:Int) -> XML {
        let child:XML = parent.child(at: idx) as! XML
        parent.removeChild(at: idx)
        return child
    }
    /**
     * EXAMPLE XMLModifier.setNameAt(database.xml, index, "menu")
     */
    static func setNameAt(_ xml:XML,_ index:Array<Int>, _ name:String) -> XML {
        XMLParser.childAt(xml, index)?.name = name
        return xml
    }
    /**
     * EXAMPLE XMLModifier.setAttributeAt(xml, [0,1], "title", "someTitle")
     * NOTE: I think this method works with depth indecies
     */
    static func setAttributeAt(_ xml:XML,_ index:Array<Int>, _ key:String,_ value:String) -> XML {
        XMLParser.childAt(xml, index)?[key] = value
        return xml
    }
    /**
     * EXAMPLE: setAttributeAt(xml,[0,1],["color":"blue","gradient":"teal"])
     * NOTE: dictionaries are unordered by nature so the attributes may be randomly arranged. To mitigate this maybe implement setting arguments through an array aswell?
     */
    static func setAttributeAt(_ xml:XML,_ index:Array<Int>, _ attributes:Dictionary<String,String>) -> XML {
        XMLParser.childAt(xml, index)?.setAttributesWith(attributes)
        return xml
    }
    /**
     * TODO: Make similar method for multiple key, value pairs
     */
    static func setAttributeAt(_ xml:XML,_ index:Int, _ key:String, _ value:String)->XML{
        let child = XMLParser.childAt(xml.children!, index)
        child![key] = value
        return xml
    }
    /**
     * TODO: Make similar method for multiple key, value pairs
     */
    static func setAttribute(_ xml:XML, _ key:String, _ value:String)->XML{
        xml[key] = value
        return xml
    }
    /**
     * EXAMPLE: replaceChildAt(xml, [0,1], child)
     * NOTE: if the index is out of bound the replacment is appended to the parent index
     */
    static func replaceAt(_ xml:XML,_ index:Array<Int>,_ replacement:XML) -> XML {
        let idx = index.slice2(0,index.count-1)
        let child = XMLParser.childAt(xml, idx)
        _ = child?.replaceAt(xml, index[index.count-1], replacement)
        return xml
    }
    /**
     * EXAMPLE: replaceChildAt(xml, 0, child)
     */
    static func replaceAt(_ xml:XML,_ index:Int,_ replacement:XML) -> XML {
        xml.replaceChild(at: index, with: replacement)//upgraded to swift 3
        return xml
    }    
}
/**
//stringValueAt
//replaceChildrenAt
//removeChildrenAt
//addChildrenAt

addXMLToXMLList,
merge,
setAttribute,
addAttribute,
applyXmlAttributesToObject,
addChildAt,
insertAt,
removeChildAt,
removeChildrenAt,
replaceChildAt,
replaceChildrenAt,
setNameAt,
setAttributeAt,
replace,
sortByName,
sortByAttribute;

*/

 /**
  * Adding attributes to an element: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSXMLElement_Class/
  * more here: https://gist.github.com/brentdax/caaaa134c500e00efd36
  * worth a look (constructing html): https://gist.github.com/brentdax/caaaa134c500e00efd36
  */

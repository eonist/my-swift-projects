import Foundation

public class XMLModifier {
    /**
     * Adding attributes to an element: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSXMLElement_Class/
     * more here: https://gist.github.com/brentdax/caaaa134c500e00efd36
     * worth a look (constructing html): https://gist.github.com/brentdax/caaaa134c500e00efd36
     */
    public class func test(){
        //xml.addChild()
    }
    /**
     * Adds @param child to @param xml at an array index @param index
     * // :TODO: needs some refactoring can we use hasComplexContent as an asserter? research
     */
    class func addChildAt(xml:NSXMLElement,_ index:Array<Int>,_ child:NSXMLElement) -> NSXMLElement {// :TODO: rename to addAt?
        let i = index.slice2(0,index.count-1)
        //Swift.print("i: " + "\(i)")
        let parent:NSXMLElement? = XMLParser.childAt(xml, i)
        //Swift.print("parent: " + "\(parent)")
        parent!.addAt(child,index[index.count-1])
        return xml
    }
    /**
     *
     */
    class func addChildAt(xml:NSXMLElement,_ child:NSXMLElement,_ index:Int) -> NSXMLElement {
        return insertAt(xml,index,child)
    }
    /**
     * Inserts @param child at @param index in @param xml
     * @Note: works similarly to the sprite.addChildAt() function
     */
    class func insertAt(xml:NSXMLElement,_ index:Int,_ child:NSXMLElement) -> NSXMLElement {
        xml.insertChild(child, atIndex: index)
        return xml;
    }
    /**
     * @example XMLModifier.removeChildAt(xml, [0,0]);
     */
    class func removeChildAt(xml:NSXMLElement,_ index:Array<Int>) -> NSXMLElement {// :TODO: remove may need to be recursive, rename to removeAt?
        XMLParser.childAt(xml, index.slice2(0,index.count-1))?.removeChildAtIndex(index[index.count-1])
        return xml
    }
    class func removeChildAt(xml:NSXMLElement,_ index:Int) -> NSXMLElement {
        xml.removeChildAtIndex(index)
        return xml
    }
    /**
     * @example XMLModifier.setNameAt(database.xml, index, "menu")
     */
    class func setNameAt(xml:NSXMLElement,_ index:Array<Int>, _ name:String) -> NSXMLElement {
        XMLParser.childAt(xml, index)?.name = name
        return xml
    }
    /**
     * @example XMLModifier.setAttributeAt(xml, [0,1], "title", "someTitle")
     */
    class func setAttributeAt(xml:NSXMLElement,_ index:Array<Int>, _ key:String,_ value:String) -> NSXMLElement {
        XMLParser.childAt(xml, index)?[key] = value
        return xml
    }
    
    //continue: make setAttributesAt
    
    //setAttributesAt
    //setNameAt
    //stringValueAt
    //replaceChildrenAt
    //replaceChildAt
    //removeChildrenAt
    //addChildrenAt
}

/**
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
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
        XMLParser.childAt(xml, index.slice2(0,index.count-1))?.addChild(<#T##child: NSXMLNode##NSXMLNode#>)
        
        /*
        if(index.count == 1) {xml = insertAt(xml, index[0], child)}
        else if(index.count > 1 && xml.childCount > 0 && (xml.children![index[0]] as! NSXMLElement).hasComplexContent()){
            xml = addChildAt(xml.children![index[0]] as! NSXMLElement,index.slice2(1,index.count),child)
        }
        return xml
        */
    }
    /**
     * Inserts @param child at @param index in @param xml
     * @Note: works similarly to the sprite.addChildAt() function
     */
    class func insertAt(xml:NSXMLElement,_ index:Int,_ child:NSXMLElement) -> NSXMLElement {
        xml.insertChild(child, atIndex: index)
        return xml;
    }
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
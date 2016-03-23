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
    class func addChildAt(var xml:NSXMLElement,_ index:Array<Int>,_ child:NSXMLElement) -> NSXMLElement {// :TODO: rename to addAt?
        if(index.count == 1) {xml = insertAt(xml, index[0], child)}
        else if(index.count > 1 && xml.childCount > 0 && xml.children[index[0]] != nil){
            xml = addChildAt(xml.children[index[0]],index.slice(1,index.length),child);
        }
        return xml;
    }
    /**
     * Inserts @param child at @param index in @param xml
     * @Note: works similarly to the sprite.addChildAt() function
     */
    class func insertAt(xml:NSXMLElement,_ index:Int,_ child:NSXMLElement) -> NSXMLElement {
        
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
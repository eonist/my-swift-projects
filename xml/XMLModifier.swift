import Foundation

public class XMLModifier {
    /**
     * Adding attributes to an element: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSXMLElement_Class/
     * more here: https://gist.github.com/brentdax/caaaa134c500e00efd36
     * worth a look (constructing html): https://gist.github.com/brentdax/caaaa134c500e00efd36
     */
    public class func test(){
        //xml.addChild()
        
        /**
         * Adds @param child to @param xml at an array index @param index
         * // :TODO: needs some refactoring can we use hasComplexContent as an asserter? research
         */
        public static function addChildAt(xml:XML,index:Array,child:XML):XML {// :TODO: rename to addAt?
            if(index.length == 1) xml = insertAt(xml, index[0], child);
            else if(index.length > 1 && xml.children().length() > 0 && (xml.children()[index[0]] as XML).toXMLString() != null){
                xml = addChildAt(xml.children()[index[0]],index.slice(1,index.length),child);
            }
            return xml;
        }
        /**
         * Inserts @param child at @param index in @param xml
         * @Note: works similarly to the sprite.addChildAt() function
         */
        public static function insertAt(xml:XML,index:int,child:XML):XML {
            if(index == 0) xml.prependChild(child);
            else if(xml.children().length() == index) xml.appendChild(child);//xml.insertChildAfter(xml.children()[index-1], child);//xml.appendChild(<item title="Test"/>);//;
            else xml.insertChildBefore(xml.children()[index], child);
            return xml;
        }
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
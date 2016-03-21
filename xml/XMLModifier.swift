import Foundation

public class XMLModifier {
    /**
     * Adding attributes to an element: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSXMLElement_Class/
     * more here: https://gist.github.com/brentdax/caaaa134c500e00efd36
     * worth a look (constructing html): https://gist.github.com/brentdax/caaaa134c500e00efd36
     */
    public class func test(){
        
    }
    
    /**
     * @example XMLModifier.removeChildAt(xml, [0,0]);
     * // :TODO: try to make a recursive remove function that doesnt need the match code snippet
     */
    func removeChildAt(xml:NSXMLElement,index:Array<Int>)->NSXMLElement {// :TODO: remove may need to be recursive, rename to removeAt?
        var match:NSXMLElement = XMLParser.childAt(xml.children!, index);
        replaceChildAt(xml, index, new XML());
        return match;
    }
}
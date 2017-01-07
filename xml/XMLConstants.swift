import Foundation

class XMLConstants {
    /**
     * Constant representing a text node type returned from XML.nodeKind
     * SEE: XML.nodeKind()
     */
    static var text:String = "text"
    /**
     * Constant representing a comment node type returned from XML.nodeKind
     * SEE: XML.nodeKind()
     */
    static var comment:String = "comment"
    /**
     * Constant representing a processing instruction type returned from XML.nodeKind
     * SEE: XML.nodeKind()
     */
    static var processingInstruction:String = "processing-instruction"
    /**
     * Constant representing an attribute type returned from XML.nodeKind
     * SEE: XML.nodeKind()
     */
    static var attribute:String = "attribute"
    /**
     * Constant representing a element type returned from XML.nodeKind
     * SEE: XML.nodeKind()
     */
    static var element:String = "element"
}
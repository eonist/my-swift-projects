import Foundation

class NodeModifier {
    /**
     * Removes the item @param index in @param database
     */
    func removeItemAt(database:Node, index:Array<Int>) -> NSXMLElement {
        return XMLModifier.removeChildAt(database.xml, index);
    }
}

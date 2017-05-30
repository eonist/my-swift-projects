import Foundation

class JustifyUtils{
    /**
     * Aligns from start to end
     */
    static func flexStart(_ items:[FlexBoxItemKind], _ container:CGRect){
        var x:CGFloat = container.x//interim x
        items.forEach{ item in
            item.flexible.x = x
            x += item.flexible.width
        }
    }
    /**
     * Aligns from end to start
     */
    static func flexEnd(_ items:[FlexBoxItemKind], _ container:CGRect) {
        var x:CGFloat = container.width/*interim x*/
        items.reversed().forEach{ item in/*Move backwards*/
            x -= item.flexible.width
            item.flexible.x = x
        }
    }
    /**
     * Aligns one item after the other and centers their total position
     */
    static func center(_ items:[FlexBoxItemKind], _ container:CGRect) {
        //find the totalW of all items
        let totW:CGFloat = items.reduce(0){$0 + $1.flexible.size.width}
        //Use Align.center to find x
        let p:CGPoint = Align.alignmentPoint(CGSize(totW,0), container.size, Alignment.centerCenter, Alignment.centerCenter, CGPoint())
        //create new Rect
        let newRect = CGRect(p.x,container.y,container.width,container.height)
        //Use justifyFlexStart and lay items out left to right with new rect as offset
        flexStart(items, newRect)
    }
    /**
     * Aligns all items from the absolute start to absolute end and adds equa spacing between them
     */
    static func spaceBetween(_ items:[FlexBoxItemKind], _ container:CGRect) {
        let totW:CGFloat = items.reduce(0){$0 + $1.flexible.size.width}/*find the totalW of all items*/
        let totVoid:CGFloat = container.width - totW/*find totVoid by doing w - totw*/
        let numOfVoids:CGFloat = CGFloat(items.count - 1)/*then divide this voidSpace with .count - 1 and*/
        let itemVoid:CGFloat = totVoid / numOfVoids/*iterate of each item and inserting itemVoid in + width*/
        var x:CGFloat = container.x//interim x
        items.forEach{ item in
            item.flexible.x = x
            x += item.flexible.width + itemVoid
        }
    }
    /**
     * Same as spaceBetween but does not pit to sides but rather add equal spacing there as well
     */
    static func spaceAround(_ items:[FlexBoxItemKind], _ container:CGRect) {
        let totW:CGFloat = items.reduce(0){$0 + $1.flexible.size.width}/*find the totalW of all items*/
        let totVoid:CGFloat = container.width - totW/*find totVoid by doing w - totw*/
        let numOfVoids:CGFloat = CGFloat(items.count)/*then divide this voidSpace with .count - 1 and*/
        let itemVoid:CGFloat = totVoid / numOfVoids/*iterate of each item and inserting itemVoid in + width*/
        let edgeVoid:CGFloat = itemVoid/2
        var x:CGFloat = container.x+edgeVoid//interim x
        items.forEach{ item in
            item.flexible.x = x
            x += item.flexible.width + itemVoid
        }
    }
}

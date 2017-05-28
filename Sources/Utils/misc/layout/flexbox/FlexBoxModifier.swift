import Foundation

class FlexBoxModifier{
    /**
     * TODO: Possibly use FlexItem here that decorates something
     */
    static func justifyContent<T:IPositional>(_ items:[T], _ type:FlexBoxType.Justify, _ container:CGRect) where T:ISizeable{
        switch type{
            case .flexStart:
                //Swift.print("flexStart")
                JustifyUtils.justifyFlexStart(items,container)
            case .flexEnd:
                //Swift.print("flexEnd")
                JustifyUtils.justifyFlexEnd(items, container)
            case .center:
                //Swift.print("center")
                JustifyUtils.center(items,container)
            case .spaceBetween:
                //Swift.print("spacebetween")
                JustifyUtils.spaceBetween(items,container)
            case .spaceAround:
                Swift.print("spaceAround")
                JustifyUtils.spaceAround(items,container)
        }
    }
}
class JustifyUtils{
    /**
     * Aligns from start to end
     */
    static func justifyFlexStart<T:IPositional>(_ items:[T], _ container:CGRect) where T:ISizeable{
        var x:CGFloat = container.x//interim x
        items.forEach{ item in
            item.x = x
            x += item.width
        }
    }
    /**
     * Aligns from end to start
     */
    static func justifyFlexEnd<T:IPositional>(_ items:[T], _ container:CGRect) where T:ISizeable{
        var x:CGFloat = container.width/*interim x*/
        items.reversed().forEach{ item in/*Move backwards*/
            x -= item.width
            item.x = x
        }
    }
    /**
     * Aligns one item after the other and centers their total position
     */
    static func center<T:IPositional>(_ items:[T], _ container:CGRect) where T:ISizeable{
        //find the totalW of all items
        let totW:CGFloat = items.reduce(0){$0 + $1.size.width}
        //Use Align.center to find x
        let p:CGPoint = Align.alignmentPoint(CGSize(totW,0), container.size, Alignment.centerCenter, Alignment.centerCenter, CGPoint())
        //create new Rect
        let newRect = CGRect(p.x,container.y,container.width,container.height)
        //Use justifyFlexStart and lay items out left to right with new rect as offset
        justifyFlexStart(items, newRect)
    }
    /**
     * Aligns all items from the absolute start to absolute end and adds equa spacing between them
     */
    static func spaceBetween<T:IPositional>(_ items:[T], _ container:CGRect) where T:ISizeable{
        let totW:CGFloat = items.reduce(0){$0 + $1.size.width}/*find the totalW of all items*/
        let totVoid:CGFloat = container.width - totW/*find totVoid by doing w - totw*/
        let numOfVoids:CGFloat = CGFloat(items.count - 1)/*then divide this voidSpace with .count - 1 and*/
        let itemVoid:CGFloat = totVoid / numOfVoids/*iterate of each item and inserting itemVoid in + width*/
        var x:CGFloat = container.x//interim x
        items.forEach{ item in
            item.x = x
            x += item.width + itemVoid
        }
    }
    /**
     * Same as spaceBetween but does not pit to sides but rather add equal spacing there as well
     */
    static func spaceAround<T:IPositional>(_ items:[T], _ container:CGRect) where T:ISizeable{
        let totW:CGFloat = items.reduce(0){$0 + $1.size.width}/*find the totalW of all items*/
        let totVoid:CGFloat = container.width - totW/*find totVoid by doing w - totw*/
        let numOfVoids:CGFloat = CGFloat(items.count)/*then divide this voidSpace with .count - 1 and*/
        let itemVoid:CGFloat = totVoid / numOfVoids/*iterate of each item and inserting itemVoid in + width*/
        let edgeVoid:CGFloat = itemVoid/2
        var x:CGFloat = container.x+edgeVoid//interim x
        items.forEach{ item in
            item.x = x
            x += item.width + itemVoid
        }
    }
}

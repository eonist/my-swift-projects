import Foundation

class FlexBoxAlignSelf{
    /**
     * set item y to container y
     */
    static func flexStart<T:Flexible>(_ item:T, _ container:CGRect){
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.top, Alignment.top)
    }
    /**
     * set item y to alignPoint, bottom
     */
    static func flexEnd<T:Flexible>(_ item:T, _ container:CGRect){
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.bottom, Alignment.bottom)
    }
    /**
     * set item y to alignPoint, center
     */
    static func center<T:Flexible>(_ item:T, _ container:CGRect){
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.center, Alignment.center)
    }
    /**
     * set item.y to container.y, set item.height to container.height
     */
    static func stretch<T:Flexible>(_ item:T, _ container:CGRect){
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.top, Alignment.top)
        item.height = container.size.height
    }
}

import Foundation

class FlexBoxAlignSelf{
    /**
     *
     */
    static func flexStart<T:Flexible>(_ item:T, _ container:CGRect){
        //for each, set item y to container y
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.top, Alignment.top)
    }
    /**
     *
     */
    static func flexEnd<T:Flexible>(_ item:T, _ container:CGRect){
        //for each item, set item y to alignPoint, bottom
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.bottom, Alignment.bottom)
    }
    /**
     *
     */
    static func center<T:Flexible>(_ item:T, _ container:CGRect){
        //for each item, set item y to alignPoint, center
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.center, Alignment.center)
    }
    /**
     *
     */
    static func stretch<T:Flexible>(_ item:T, _ container:CGRect){
        //for each, set item.y to container.y, set item.height to container.height
        item.pos = Align.alignmentPoint(item.size, container.size, Alignment.top, Alignment.top)
        item.height = container.size.height
    }
}

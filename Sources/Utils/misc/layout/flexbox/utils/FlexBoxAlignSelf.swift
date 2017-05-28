import Foundation

class FlexBoxAlignSelf{
    /**
     * set item y to container y
     */
    static func flexStart<T:Flexible>(_ item:T, _ container:CGRect){
        item.y = Align.alignmentPoint(item.size, container.size, Alignment.topCenter, Alignment.topCenter).y
    }
    /**
     * set item y to alignPoint, bottom
     */
    static func flexEnd<T:Flexible>(_ item:T, _ container:CGRect){
        item.y = Align.alignmentPoint(item.size, container.size, Alignment.bottomCenter, Alignment.bottomCenter).y
    }
    /**
     * set item y to alignPoint, center
     */
    static func center<T:Flexible>(_ item:T, _ container:CGRect){
        item.y = Align.alignmentPoint(item.size, container.size, Alignment.centerCenter, Alignment.center).y
    }
    /**
     * set item.y to container.y, set item.height to container.height
     */
    static func stretch<T:Flexible>(_ item:T, _ container:CGRect){
        item.y = Align.alignmentPoint(item.size, container.size, Alignment.topCenter, Alignment.topCenter).y
        item.height = container.size.height
    }
}

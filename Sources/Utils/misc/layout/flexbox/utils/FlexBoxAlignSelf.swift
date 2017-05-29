import Foundation

class FlexBoxAlignSelf{
    /**
     * set item y to container y
     */
    static func flexStart(_ item:FlexBoxItem, _ container:CGRect){
        item.flexible.y = Align.alignmentPoint(item.flexible.size, container.size, Alignment.topCenter, Alignment.topCenter,container.topLeft).y
    }
    /**
     * set item y to alignPoint, bottom
     */
    static func flexEnd(_ item:FlexBoxItem, _ container:CGRect){
        item.flexible.y = Align.alignmentPoint(item.flexible.size, container.size, Alignment.bottomCenter, Alignment.bottomCenter,container.topLeft).y
    }
    /**
     * set item y to alignPoint, center
     */
    static func center(_ item:FlexBoxItem, _ container:CGRect){
        item.flexible.y = Align.alignmentPoint(item.flexible.size, container.size, Alignment.centerCenter, Alignment.center,container.topLeft).y
    }
    /**
     * set item.y to container.y, set item.height to container.height
     */
    static func stretch(_ item:FlexBoxItem, _ container:CGRect){
        item.flexible.y = Align.alignmentPoint(item.flexible.size, container.size, Alignment.topCenter, Alignment.topCenter,container.topLeft).y
        item.flexible.size = CGSize(item.flexible.size.width,container.size.height)
    }
}

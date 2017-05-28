import Foundation

class FlexBoxModifier{
    /**
     * TODO: ⚠️️ Possibly use FlexItem here that decorates something
     * Positions items along the x axis
     */
    static func justifyContent<T:Flexible>(_ items:[T], _ type:FlexBoxType.Justify, _ container:CGRect){
        switch type{
            case .flexStart:
                JustifyUtils.flexStart(items,container)
            case .flexEnd:
                JustifyUtils.flexEnd(items, container)
            case .center:
                JustifyUtils.center(items,container)
            case .spaceBetween:
                JustifyUtils.spaceBetween(items,container)
            case .spaceAround:
                JustifyUtils.spaceAround(items,container)
        }
    }
    /**
     * Vertically aligns a row of items
     */
    static func alignItems<T:Flexible>(_ items:[T], _ type:FlexBoxType.AlignItems, _ container:CGRect) {
        switch type{
            case .flexStart:
                JustifyUtils.flexStart(items,container)
            case .flexEnd:
                JustifyUtils.flexEnd(items, container)
            case .center:
                JustifyUtils.center(items,container)
            case .stretch:
                JustifyUtils.spaceBetween(items,container)
        }
    }
    /**
     * Vertically aligns a single item
     */
    static func alignSelf<T:Flexible>(_ items:T, _ type:FlexBoxType.AlignItems, _ container:CGRect){
        switch type{
            case .flexStart:
                JustifyUtils.flexStart(items,container)
            case .flexEnd:
                JustifyUtils.flexEnd(items, container)
            case .center:
                JustifyUtils.center(items,container)
            case .stretch:
                JustifyUtils.spaceBetween(items,container)
        }
    }
}
private class AlignSelf{
    static func flexStart<T:Flexible>(_ items:[T], _ container:CGRect){
        //for each, set item y to container y
    }
    /**
     *
     */
    static func flexEnd<T:Flexible>(_ items:[T], _ container:CGRect){
        //for each item, set item y to alignPoint, bottom
    }
    /**
     *
     */
    static func center<T:Flexible>(_ items:[T], _ container:CGRect){
        //for each item, set item y to alignPoint, center
    }
    /**
     *
     */
    static func stretch<T:Flexible>(_ items:[T], _ container:CGRect){
        //for each, set item.y to container.y, set item.height to container.height
    }
}

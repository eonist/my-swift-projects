import Foundation

class FlexBoxModifier{
    /**
     *
     */
    static func flex(_ container:FlexBoxContainer){
        FlexBoxGrowUtils.grow(container.flexItems,container.rect)
        FlexBoxModifier.justifyContent(container.flexItems, container.justifyContent, container.rect)
        FlexBoxModifier.alignItems(container.flexItems, container.alignItems, container.rect)
    }
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
    static func alignItems<T:Flexible>(_ items:[T], _ type:FlexBoxType.AlignSelf, _ container:CGRect) {
        items.forEach{alignSelf($0,type,container)}
    }
    /**
     * Vertically aligns a single item
     */
    static func alignSelf<T:Flexible>(_ item:T, _ type:FlexBoxType.AlignSelf, _ container:CGRect){
        switch type{
            case .flexStart:
                FlexBoxAlignSelf.flexStart(item,container)
            case .flexEnd:
                FlexBoxAlignSelf.flexEnd(item, container)
            case .center:
                FlexBoxAlignSelf.center(item,container)
            case .stretch:
                FlexBoxAlignSelf.stretch(item,container)
        }
    }
}

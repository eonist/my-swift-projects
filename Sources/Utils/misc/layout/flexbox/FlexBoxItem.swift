import Foundation

/**
 * TODO: Needs init size, size
 * NOTE: Shorthand: flex: <flex-grow> <flex-shrink> <flex-basis>; Flex:1 0 auto. This shorthand is broken down into three flexbox properties in this order: flex-grow, flex-shrink, and flex-basis.
 * IMPORTANT: ⚠️️ Set grow and shrink to 0 if you want to fix the width of an item
 * IMPORTANT: ⚠️️ set basis to 25% and grow 1. And then add 3 tiems. each of them will actually take up 33.3%, and a fourth and they take up 25%
 */
struct FlexBoxItem:FlexBoxItemKind{
    var initRect:CGRect//stores the init frame of the flexible
    var flexible:Flexible
    /**
     * Grow: defined how much of the remainder of the space it should use. Canvas: 400, text: 300 : button.grow:1 = 100, grow:2 = 50?
     * NOTE: flex-grow:0 simply means that the item won't be resized during item size calculation to accommodate flex container's full main axis size.
     * NOTE: if you have 3 items in a 300px container. and they are grow:1 then their space will be: 1/3 aka 100px. If 1 is grow:2 then its width will be as if there are 4 items. so 300/4*2 and the two other will be: 300/4*1
     * IMPORTANT: ⚠️️ if there is a fixed item in the container, the remainder space will be container - fixed-
     */
    var grow:CGFloat = 1/*The element will not grow if there's space available. It will only use the space it needs.*/
    var shrink:CGFloat = 0/*If there's not enough space available in the container's main axis, the element will shrink by a factor of 1, and will wrap its content.*/
    /**
     * Flex-basis: When flex-direction is row, flex-basis controls width, But when flex-direction is column, flex-basis controls height.
     * NOTE: flex-basis works like max-width
     * NOTE: nil means auto
     * NOTE: "auto" or px,ems, (auto means get width from child width. text,img etc)
     */
    var basis:CGFloat? = nil
    init(_ flexible:Flexible,_ grow:CGFloat = 1,_ basis:CGFloat? = nil, _ shrink:CGFloat = 0){
        self.initRect = FlexibleUtils.rect(flexible)
        self.flexible = flexible
        self.grow = grow
        self.basis = basis
        self.shrink = shrink
    }
}

//Continue here: 

    //Shrink
        //Think of it as rate of shrink. so if you have 2 items, 1 has shrink to 1 and the other has shrink to 2
            //and grow is: 1 and 2. 
            //Now you have, since there is no basis, the basline will be stipulated via remainder divided by grow count and then added to each item 
                //shrink will effectivly not be considered
                //so you need basis for shrink to work 👈 not really true. 
                    //What if you divide the grow with the shrink on items that has shrink. so if grow is 1 and shrink is two then you devide and get 0.5
                    //basis is actually max-width 💡




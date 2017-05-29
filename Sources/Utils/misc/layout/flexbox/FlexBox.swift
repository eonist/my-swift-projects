import Foundation
//Continue here 🏀
    //Figure out shrink and grow. and if 100% works etc
    //figure out direction, will items strech then? etc
/**
 * display:flex;
 */
class FlexBox {}
enum FlexWrapType:String{
    case noWrap = "noWrap"
    case wrap = "wrap"
    //wrapReverse, not supported yet
}
struct FlexContainer{
    var flexibles:[Flexible]
    var wrapType:FlexWrapType
    //var flexDir:FlowFlexDirType,row,collumn,reverseRow,collumnReverse
}
/**
 * TODO: Needs init size, size
 * Grow: defined how much of the remainder of the space it should use. Canvas: 400, text: 300 : button.grow:1 = 100, grow:2 = 50?
 */
struct FlexItem{
    var flexible:Flexible
    var grow:Int = 0/*The element will not grow if there's space available. It will only use the space it needs.*/
    var shrink:Int = 1/*If there's not enough space available in the container's main axis, the element will shrink by a factor of 1, and will wrap its content.*/
    var basis:Int? = nil//nil means auto
    //var flexBasis:CGFloat "auto" or px,ems auto means get width from child width. text,img etc
}
typealias Flexible = IPositional & ISizeable

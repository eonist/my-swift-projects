import Foundation
//FlexContainer ->
//FlexItem -> init size, size,
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
struct FlexItem{
    var flexible:Flexible
    var grow:Int = 0/*The element will not grow if there's space available. It will only use the space it needs.*/
    var shrink:Int = 1/*If there's not enough space available in the container's main axis, the element will shrink by a factor of 1, and will wrap its content.*/
    var 
}
typealias Flexible = IPositional & ISizeable

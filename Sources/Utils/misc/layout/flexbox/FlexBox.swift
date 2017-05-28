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
    
}
struct FlexItem{
    var flexible:Flexible
    var grow:Int = 0
    var shring:Int = 1
}
typealias Flexible = IPositional & ISizeable

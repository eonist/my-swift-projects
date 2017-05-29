import Foundation

struct FlexBoxContainer{
    var rect:CGRect
    var flexibles:[Flexible]
    //var wrapType:FlexWrapType
    //var flexDir:FlowFlexDirType,row,collumn,reverseRow,collumnReverse
    init(_ rect:CGRect, flexibles:[Flexible]){
        self.rect = rect
        self.flexibles = flexibles
    }
}

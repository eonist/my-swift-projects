import Foundation

struct FlexBoxContainer{
    var rect:CGRect
    var flexibles:[Flexible]
    var justifyContent:FlexBoxType.AlignItems
    //var wrapType:FlexWrapType
    //var flexDir:FlowFlexDirType,row,collumn,reverseRow,collumnReverse
    init(_ rect:CGRect, _ flexibles:[Flexible] = [], _ justifyContent:FlexBoxType.AlignItems = .flexStart){
        self.rect = rect
        self.flexibles = flexibles
        self.justifyContent = justifyContent
    }
}

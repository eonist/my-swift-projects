import Foundation

struct FlexBoxContainer:FlexBoxContainerKind{
    var rect:CGRect
    var flexBoxItems:[FlexBoxItemKind]
    var justifyContent:FlexBoxType.Justify
    var alignItems:FlexBoxType.AlignType
    //var wrapType:FlexWrapType
    //var flexDir:FlowFlexDirType,row,collumn,reverseRow,collumnReverse
    init(_ rect:CGRect, _ flexBoxItems:[FlexBoxItemKind] = [], _ justifyContent:FlexBoxType.Justify = .flexStart, _ alignItems:FlexBoxType.AlignType = .flexStart){
        self.rect = rect
        self.flexBoxItems = flexBoxItems
        self.justifyContent = justifyContent
        self.alignItems = alignItems
    }
}

import Foundation

struct FlexBoxContainer{
    var rect:CGRect
    var flexBoxItems:[FlexBoxItem]
    var justifyContent:FlexBoxType.Justify
    var alignItems:FlexBoxType.AlignType
    //var wrapType:FlexWrapType
    //var flexDir:FlowFlexDirType,row,collumn,reverseRow,collumnReverse
    init(_ rect:CGRect, _ flexBoxItems:[FlexBoxItem] = [], _ justifyContent:FlexBoxType.Justify = .flexStart, _ alignItems:FlexBoxType.AlignType = .flexStart){
        self.rect = rect
        self.flexBoxItems = flexBoxItems
        self.justifyContent = justifyContent
        self.alignItems = alignItems
    }
}

extension FlexBoxContainer{
    var flexibles:[Flexible] {return flexBoxItems.map{$0.flexible}}
}

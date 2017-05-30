import Foundation

protocol FlexBoxContainerKind {
    var rect:CGRect {get}
    var flexBoxItems:[FlexBoxItemKind] {get set}
    var justifyContent:FlexBoxType.Justify {get}
    var alignItems:FlexBoxType.AlignType {get}
}

import Foundation

enum TextFormatConstants:String {
    case selectable = "selectable"
    case background = "background"
    case backgroundColor = "backgroundColor"
    case color = "color"
    case align = "align"
    case font = "font"
    case size = "size"
    case type = "type"/*static and input*/
    case border = "border"
    case multiline = "multiline"
    case wordWrap = "wordWrap"
    case scrollable = "scrollable"
    case leading = "leading"/*line-spacing*/
}
extension TextFormatConstants{
    var textFormatPropertyNames:[String] {
        return [
            TextFormatConstants.size.rawValue,
            TextFormatConstants.font.rawValue,
            TextFormatConstants.align.rawValue,
            TextFormatConstants.selectable.rawValue,
            TextFormatConstants.background.rawValue,
            TextFormatConstants.backgroundColor.rawValue,
            TextFormatConstants.color.rawValue,
            TextFormatConstants.type.rawValue,
            TextFormatConstants.border.rawValue,
            TextFormatConstants.multiline.rawValue,
            TextFormatConstants.wordWrap.rawValue,
            TextFormatConstants.scrollable.rawValue,
            TextFormatConstants.leading.rawValue
        ]
    }
}

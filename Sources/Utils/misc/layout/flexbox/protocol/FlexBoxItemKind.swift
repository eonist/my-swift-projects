import Foundation

protocol FlexBoxItemKind {
    var initRect:CGRect {get}
    var flexible:Flexible {get}
    var grow:CGFloat {get set}
    var shrink:CGFloat {get}
    var basis:CGFloat? {get}
}

import Foundation

enum SVGLineJoin:String{
    case miter = "miter"
    case round = "round"
    case bevel = "bevel"
}
extension SVGLineJoin{
    static func lineJoin(_ lineJoin:SVGLineJoin) -> CGLineJoin {
        switch lineJoin {
            case .miter:return .miter
            case .round:return .round
            case .bevel:return .bevel
        }
    }
}

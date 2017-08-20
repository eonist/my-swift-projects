import Foundation

enum SVGLineCap:String{
    case butt = "butt"
    case round = "round"
    case square = "square"
}
extension SVGLineCap{
    static func lineCap(_ lineCap:SVGLineCap) -> CGLineCap {
        switch lineCap {
            case .butt:return .butt
            case .round:return .round
            case .square:return .square
        }
    }
}

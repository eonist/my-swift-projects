import Foundation
protocol IGraphicsStyle {
    var fill: String { get set }
    var stroke: String { get set }
}
class GraphicStyle {
    var fill: IFillStyle //{ get {return self.fill} set {self.fill = newValue} }
    var line: ILineStyle //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fill:IFillStyle,_ line:ILineStyle) {
        self.fill = fill;
        self.line = line;
    }
}

import Foundation
protocol IGraphicsStyle {
    var fill: String { get set }
    var stroke: String { get set }
}
class GraphicStyle {
    var fill: IFill //{ get {return self.fill} set {self.fill = newValue} }
    var stroke: IStroke //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fill:IFill,_ stroke:IStroke) {
        self.fill = fill;
        self.stroke = stroke;
    }
}

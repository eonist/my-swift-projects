import Foundation
protocol IGraphicsStyle {
    var fill: IFill { get set }
    var stroke: IStroke { get set }
}
class GraphicStyle:IGraphicsStyle {
    static var clear:IGraphicsStyle = GraphicStyle(Fill.clear,Stroke.clear)
    var fill: IFill //{ get {return self.fill} set {self.fill = newValue} }
    var stroke: IStroke //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fill:IFill,_ stroke:IStroke) {
        self.fill = fill;
        self.stroke = stroke;
    }
}
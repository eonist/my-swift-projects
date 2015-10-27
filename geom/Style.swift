import Cocoa
protocol IStyle {
    var fill: IFill { get set }
    var stroke: IStroke { get set }
}
class GraphicStyle:IStyle {
    static var clear:IStyle = GraphicStyle(Fill.clear,Stroke.clear)
    static var green:IStyle = GraphicStyle(Fill(NSColor.greenColor()),Stroke.clear)
    var fill: IFill //{ get {return self.fill} set {self.fill = newValue} }
    var stroke: IStroke //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fill:IFill = Fill.clear,_ stroke:IStroke = Stroke.clear) {
        self.fill = fill;
        self.stroke = stroke;
    }
}
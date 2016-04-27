import Cocoa
protocol IGraphicStyle {
    var fill: IFillStyle? { get set }
    var stroke: ILineStyle { get set }
}
class GraphicStyle:IGraphicStyle {
    //static var clear:IGraphicStyle = GraphicStyle(Fill.clear,Stroke.clear)
    //static var green:IGraphicStyle = GraphicStyle(Fill(NSColor.greenColor()),Stroke.clear)
    var fill: IFillStyle? //{ get {return self.fill} set {self.fill = newValue} }
    var stroke: ILineStyle //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fill:IFill? = Fill.clear/*<-maybe not use clear here, nil works aswell*/,_ stroke:IStroke = Stroke.clear) {
        self.fill = fill;
        self.stroke = stroke;
    }
}

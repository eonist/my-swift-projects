import Cocoa

class GraphicStyle:IGraphicStyle {
    //static var clear:IGraphicStyle = GraphicStyle(Fill.clear,Stroke.clear)
    //static var green:IGraphicStyle = GraphicStyle(Fill(NSColor.greenColor()),Stroke.clear)
    var fillStyle: IFillStyle? //{ get {return self.fill} set {self.fill = newValue} }
    var lineStyle: ILineStyle? //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fillStyle:IFillStyle? = nil ,_ lineStyle:ILineStyle? = nil) {
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
    }
}
import Cocoa

class GraphicStyle:IGraphicStyle {
    var fillStyle: IFillStyle? //{ get {return self.fill} set {self.fill = newValue} }
    var lineStyle: ILineStyle? //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fillStyle:IFillStyle? = nil ,_ lineStyle:ILineStyle? = nil) {
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
    }
}
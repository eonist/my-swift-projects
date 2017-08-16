import Cocoa

class GraphicStyle:GraphicStylable {
    var fillStyle: FillStyleKind? //{ get {return self.fill} set {self.fill = newValue} }
    var lineStyle: LineStylable? //{ get {return self.stroke } set {self.stroke = newValue}}
    init(_ fillStyle:FillStyleKind? = nil ,_ lineStyle:LineStylable? = nil) {
        self.fillStyle = fillStyle
        self.lineStyle = lineStyle
    }
}

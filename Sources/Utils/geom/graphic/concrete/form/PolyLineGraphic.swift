import Foundation

class PolyLineGraphic:PathGraphic{
    var points:[CGPoint]
    init(_ points:[CGPoint], _ decoratable:GraphicDecoratableKind = BaseGraphic(nil,LineStyle())) {
        self.points = points
        let path:PathKind = PolyLineGraphicUtils.path(points)/*Convert points to a Path*/
        super.init(path, decoratable)
    }
    func setPoints(points:[CGPoint]) {
        self.points = points
        draw()
    }
}

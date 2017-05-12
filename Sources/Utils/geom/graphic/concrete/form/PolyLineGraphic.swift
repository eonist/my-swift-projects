import Foundation

class PolyLineGraphic:PathGraphic{
    var points:[CGPoint]
    init(_ points:[CGPoint], _ decoratable:IGraphicDecoratable = BaseGraphic(nil,LineStyle())) {
        self.points = points
        let path:IPath = PolyLineGraphicUtils.path(points)/*Convert points to a Path*/
        super.init(path, decoratable)
    }
    func setPoints(points:[CGPoint]) {
        self.points = points
        draw()
    }
}
extension PolyLineGraphic{
    convenience init(_ points:[CGPoint], _ fillStyle:IFillStyle?, _ lineStyle:ILineStyle?) {
        self.init(points, BaseGraphic(fillStyle,lineStyle))
    }
    convenience init(_ points:[CGPoint], _ gradientFillStyle:IGradientFillStyle?, _ gradientlineStyle:IGradientLineStyle?) {
        self.init(points, GradientGraphic(BaseGraphic(gradientFillStyle,gradientlineStyle)))
    }
}
class PolyLineGraphicUtils{
    /**
     * NOTE: Rename to pathByPoints?, as swift supports method overloading, you don't need that speccific naming
     */
    static func path(_ points:[CGPoint]) -> IPath {
        return (1..<points.count).indices.reduce(Path([PathCommand.moveTo.rawValue],[points[0].x,points[0].y])) { path,i in
            var path = path
            path.commands.append(PathCommand.lineTo.rawValue)
            let p:CGPoint = points[i]
            path.pathData += [p.x,p.y]
            return path
        }
    }
}

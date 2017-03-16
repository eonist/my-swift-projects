import Foundation

class PolyLineGraphic:PathGraphic{
    var points:[CGPoint]
    init(_ points:[CGPoint], _ decoratable:IGraphicDecoratable = BaseGraphic(nil,LineStyle())) {
        self.points = points
        let path:IPath = PolyLineGraphicUtils.path(points)/*convert points to a Path*/
        super.init(path, decoratable)
    }
    func setPoints(points:[CGPoint]) {
        self.points = points
        draw()
    }
}
extension PolyLineGraphic{
    convenience init(_ points:[CGPoint], _ fillStyle:IFillStyle?, _ lineStyle:ILineStyle?) {
        //Swift.print("PolyLineGraphic.init() type: BaseGraphic")
        self.init(points, BaseGraphic(fillStyle,lineStyle))
    }
    convenience init(_ points:[CGPoint], _ gradientFillStyle:IGradientFillStyle?, _ gradientlineStyle:IGradientLineStyle?) {
        //Swift.print("PolyLineGraphic.init() type: GradientGraphic")
        self.init(points, GradientGraphic(BaseGraphic(gradientFillStyle,gradientlineStyle)))
    }
}
class PolyLineGraphicUtils{
    /**
     * NOTE: rename to pathByPoints?, as swift supports method overloading, you don't need that speccific naming
     */
    static func path(_ points:[CGPoint]) -> IPath {
        var commands:[Int] = [PathCommand.moveTo]
        var pathData:[CGFloat] = [points[0].x,points[0].y]
        for i in 1..<points.count{//swift 3 update
            commands.append(PathCommand.lineTo)
            let p:CGPoint = points[i]
            pathData += [p.x,p.y]
        }
        return Path(commands, pathData)
    }
}

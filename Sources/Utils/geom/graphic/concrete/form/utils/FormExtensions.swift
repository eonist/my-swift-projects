import Foundation

extension RoundRectGraphic{
    convenience init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat, _ height:CGFloat,_ fillet:Fillet, _ gradientFillStyle:GradientFillStyle, _ gradientLineStyle:GradientLineStyle, _ lineOffset:OffsetType = OffsetType(OffsetType.center)){/*Gradient fill and stroke*/
        self.init(RectGraphic(CGPoint(x,y),CGSize(width,height),GradientGraphic(BaseGraphic(gradientFillStyle,gradientLineStyle,lineOffset))),fillet)
    }
    convenience init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat,_ fillet:Fillet,_ fillStyle:FillStyleKind?, _ lineStyle:LineStylable?, _ lineOffset:OffsetType = OffsetType(OffsetType.center)){
        self.init(RectGraphic(x,y,width,height,fillStyle,lineStyle,lineOffset),fillet)
    }
}
extension PolyLineGraphic{
    convenience init(_ points:[CGPoint], _ fillStyle:FillStyleKind?, _ lineStyle:LineStylable?) {
        self.init(points, BaseGraphic(fillStyle,lineStyle))
    }
    convenience init(_ points:[CGPoint], _ gradientFillStyle:GradientFillStyleKind?, _ gradientlineStyle:GradientLineStylable?) {
        self.init(points, GradientGraphic(BaseGraphic(gradientFillStyle,gradientlineStyle)))
    }
}
extension PathGraphic{
    convenience init(_ path:PathKind, _ fillStyle:FillStyleKind?, _ lineStyle:LineStylable?) {/*Convenience*/
        let graphic:GraphicDecoratableKind = fillStyle is GradientFillStyleKind || lineStyle is GradientLineStylable ? GradientGraphic(BaseGraphic(fillStyle,lineStyle)) : BaseGraphic(fillStyle,lineStyle)
        self.init(path, graphic)
    }
}
extension LineGraphic{
    convenience init(_ p1:CGPoint = CGPoint(), _ p2:CGPoint = CGPoint(), _ lineStyle:LineStylable) {
        self.init(p1,p2, BaseGraphic(nil,lineStyle))
    }
    convenience init(_ p1:CGPoint = CGPoint(), _ p2:CGPoint = CGPoint(), _ gradientlineStyle:GradientLineStyle) {
        self.init(p1,p2, GradientGraphic(BaseGraphic(nil,gradientlineStyle)))
    }
}

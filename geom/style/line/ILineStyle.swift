import Cocoa

protocol ILineStyle{
    var color:NSColor {get set}
    var thickness:CGFloat {get set}
    var lineCap:CGLineCap {get set}//TODO: rename to capStyle?
    var lineJoin:CGLineJoin {get set}//TODO: rename to jointStyle
    var miterLimit:CGFloat {get set}
    var phase:CGFloat {get set}
    var lengths:Array<CGFloat> {get set}
}
extension ILineStyle{
    func copy() -> ILineStyle {
        return LineStyleParser.clone(self)
    }
    func mix(_ color:NSColor)->ILineStyle{
        var c = copy()
        c.color = color
        return c
    }
    mutating func alpha(_ alpha:CGFloat)->ILineStyle{/*Convenience*/
        self.color = self.color.alpha(alpha)
        return self
    }
    mutating func color(_ color:NSColor)->ILineStyle{/*Convenience*/
        self.color = color
        return self
    }
}

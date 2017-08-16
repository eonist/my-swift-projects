import Cocoa

protocol LineStylable{
    var color:NSColor {get set}
    var thickness:CGFloat {get set}
    var lineCap:CGLineCap {get set}//TODO: rename to capStyle?
    var lineJoin:CGLineJoin {get set}//TODO: rename to jointStyle
    var miterLimit:CGFloat {get set}
    var phase:CGFloat {get set}
    var lengths:[CGFloat] {get set}
}
extension LineStylable{
    func copy() -> LineStylable {
        return LineStyleParser.clone(self)
    }
    func mix(_ color:NSColor)->LineStylable{
        var c = copy()
        c.color = color
        return c
    }
    mutating func alpha(_ alpha:CGFloat)->LineStylable{/*Convenience*/
        self.color = self.color.alpha(alpha)
        return self
    }
    mutating func color(_ color:NSColor)->LineStylable{/*Convenience*/
        self.color = color
        return self
    }
}

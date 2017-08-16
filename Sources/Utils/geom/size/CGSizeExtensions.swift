import Foundation
/*Convenient extensions*/
extension CGSize {
    init(_ width:CGFloat,_ height:CGFloat){self.width = width;self.height = height}
    init(_ width:Double,_ height:Double){self.width = CGFloat(width);self.height = CGFloat(height)}
    init(_ width:Int,_ height:Int){self.width = CGFloat(width);self.height = CGFloat(height)}
    var w:CGFloat {set {self.width = newValue} get {return self.width}}
    var h:CGFloat {set {self.height = newValue} get {return self.height}}
    func isNear(_ p:CGSize,_ epsilon:CGFloat) -> Bool {return CGPointAsserter.nearEquals(CGPoint(self.w,self.h), CGPoint(p.w,p.h), epsilon)}
    subscript(dir:Dir) -> CGFloat {/*Convenience*/
        get {
            switch dir{
                case .hor:
                    return self.width
                case .ver:
                    return self.height
            }
        }set {
            switch dir{
                case .hor:
                    self.width = newValue
                case .ver:
                    self.height = newValue
            }
        }
    }
    func clip(_ min:CGSize,_ max:CGSize)->CGSize{
        let w:CGFloat = self.width.clip(min.width, max.width)
        let h:CGFloat = self.height.clip(min.height, max.height)
        return CGSize(w,h)
    }
    func interpolate(_ to:CGSize, _ scalar:CGFloat) -> CGSize{/*Convenience*/
        return CGSize(self.w.interpolate(to.w, scalar), self.h.interpolate(to.h, scalar))
    }
    
}
public func +(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width + b.width,a.height + b.height)}
public func -(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width - b.width,a.height - b.height)}
public func +=( a: inout CGSize, b: CGSize) {a.width += b.width;a.height += b.height}/*modifies a by adding b*/
public func -=( a: inout CGSize, b: CGSize) {a.width -= b.width;a.height -= b.height}/*modifies a by subtracting b*/
public func * (a: CGSize, b: CGSize) -> CGSize {return CGSize(a.w*b.w, a.h*b.h)}
public func * (a: CGSize, b: CGFloat) -> CGSize {return CGSize(a.w*b, a.h*b)}
//TODO: add more  

import Foundation

/**
 * Move the logic into CGRectModifier and CGRectParser and CGRectAsserter
 * For rect.isWithin(point) use: rect.contains(point)
 * RESEARCH: lots of Convenient CGRect methods here: https://github.com/nschum/SwiftCGRectExtensions/blob/master/CGRectExtensions/CGRectExtensions.swift
 */
extension CGRect {
    /**
     * Clones CGRect
     * EXAMPLE: CGRect(0,0,100,100).clone()
     */
    func clone()->CGRect{//remove this, use copy instead
        return CGRect(self.origin.x,self.origin.y,self.width,self.height)
    }
    /**
     * Same as clone (Consistency)
     */
    func copy()->CGRect{
        return CGRect(self.origin.x,self.origin.y,self.width,self.height)
    }
    /**
     * Create a path using the coordinates of the rect passed in
     * EXAMPLE: CGRect(0,0,100,100).path
     */
    var path:CGMutablePath{return CGRectParser.path(self)}
    /*Initialization*/
    init(_ pos:CGPoint,_ size:CGSize){ self.init(origin: pos, size: size)}
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat){ self.origin = CGPoint(x,y); self.size = CGSize( width, height);}//TODO:add initializer to CGSize
    init(_ x:Double,_ y:Double,_ width:Double,_ height:Double){ self.origin = CGPoint(x,y); self.size = CGSize( width, height);}//TODO:add initializer to CGSize
    init(_ x:CGFloat,_ y:CGFloat,_ width:Double,_ height:Double){ self.origin = CGPoint(x,y); self.size = CGSize(width,height);}
    init(_ x:Int,_ y:Int,_ width:Double,_ height:Double){ self.origin = CGPoint(x,y); self.size = CGSize(width,height);}
    /*Position*/
    var x:CGFloat {set {origin.x = newValue} get {return origin.x} }
    var y:CGFloat {set {origin.y = newValue} get {return origin.y} }
    /*Size*/
    /*var width:CGFloat {set {size.width = newValue} get {return size.width} }
     var height:CGFloat {set {size.height = newValue} get {return size.height} }*/
    /*⚠️️ NOTE: Siwft3 seems to have problems with width get and height get as extensions so use w and h instead. set worked for some reason but still*/
    var w:CGFloat {set {size.width = newValue} get {return size.width} }
    var h:CGFloat {set {size.height = newValue} get {return size.height} }
    /*Corners*/
    var topLeft:CGPoint {get {return self.origin} }
    var point:CGPoint {get {return self.origin} }
    var bottomLeft:CGPoint {get {return CGPoint(self.minX, self.maxY)}}
    var bottomRight:CGPoint {get {return CGPoint(self.maxX, self.maxY)}}
    var topRight:CGPoint {get {return CGPoint(self.maxX, self.minY)}}
    var center:CGPoint {get {return CGPoint(self.midX, self.midY)}}
    var top:CGPoint {get {return CGPoint(self.midX, self.minY)}}
    var bottom:CGPoint {get {return CGPoint(self.midX, self.maxY)}}
    var left:CGPoint {get {return CGPoint(self.maxX, self.midY)}}
    var right:CGPoint {get {return CGPoint(self.minX, self.midY)}}
    var corners:Array<CGPoint> {return CGRectParser.corners(self)}
    var sides:Array<CGPoint>{return CGRectParser.sides(self)}
    var nsRect:NSRect {return NSRectFromCGRect(self)}
    /**
     * TODO: Maybe for x,y,width,height aswell?
     * TODO: Make it enum! it's faster
     */
    subscript(key:String) -> CGPoint {/*Easy Access to corners*/
        get {
            switch key{
               case Alignment.topLeft:return topLeft
               case Alignment.topRight:return topRight
               case Alignment.bottomRight:return bottomRight
               case Alignment.bottomLeft:return bottomLeft
               case Alignment.top:return top
               case Alignment.bottom:return bottom
               case Alignment.left:return left
               case Alignment.right:return right
               case Alignment.center:return center
               default:fatalError("UNSUPORTED CORNER TYPE: " + key)
            }
        }
        set {
            fatalError("UNSUPORTED CORNER TYPE: " + key + " WITH VALUE: " + String(describing: newValue))
        }
    }
    /**
     * negative inset equals outset
     */
    func outset(_ dx:CGFloat,_ dy:CGFloat)->CGRect{
        return insetBy(dx: -dx, dy: -dy)
    }
    /**
     * NOTE: Same as insetBy, but this method is simpler to call, similar to Outset (Convenience)
     */
    func inset(_ dx:CGFloat,_ dy:CGFloat)->CGRect{
        return insetBy(dx: dx, dy: dy)
    }
    func offset(_ dx:CGFloat,_ dy:CGFloat)->CGRect{/*Convenience*/
        return self.offsetBy(dx: dx, dy: dy)
    }
    func offset(_ point:CGPoint)->CGRect{/*Convenience*/
        return self.offsetBy(dx: point.x,dy: point.y)
    }
    /**
     * NOTE: Alters the original CGRect instance
     * Swift 3 update, as of swift 3 CGRect no longer has the offsetInPlace method. This method replaces that functionality.
     * TODO: could probably be simplified by just copying the origin.x and origin y onto self
     */
    mutating func offsetInPlace(_ point:CGPoint)->CGRect{//Convenience
        let offsetRect:CGRect = self.offset(point)
        self.origin = offsetRect.origin
        return self
    }
    /**
     * Expands the size of the rect from its pivot
     */
    func expand(_ dx:CGFloat,_ dy:CGFloat)->CGRect{
        return CGRect(self.x,self.y,self.width + dx, self.height + dy)
    }
}
public func +(a: CGRect, b: CGPoint) -> CGRect { return CGRect(a.x+b.x, a.y+b.y,a.width,a.height)}//Adds the coordinates of point p to the coordinates of this point to create a new point
public func +=(a: inout CGRect, b: CGPoint) {a.x += b.x;a.y += b.y;}//modifies a by adding b, could also have used: offsetBy()
public func -=(a: inout CGRect, b: CGPoint) {a.x -= b.x;a.y -= b.y;}//modifies a by adding b, could also have used: offsetBy()

public func +(a: CGRect, b: CGRect) -> CGRect { return CGRect(a.origin + b.origin,a.size + b.size)}
public func -(a: CGRect, b: CGRect) -> CGRect { return CGRect(a.origin - b.origin,a.size - b.size)}
public func *(a: CGRect, b: CGRect) -> CGRect { return CGRect(a.origin * b.origin,a.size * b.size)}
//public func -(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width - b.width,a.height - b.height)}
//public func * (a: CGSize, b: CGSize) -> CGSize {return CGSize(a.w*b.w, a.h*b.h)}

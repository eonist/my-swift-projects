import Foundation
//lots of great stuff here: https://github.com/nschum/SwiftCGRectExtensions/blob/master/CGRectExtensions/CGRectExtensions.swift

extension CGRect {
    /**
     * Clones CGRect
     * EXAMPLE: CGRect(0,0,100,100).clone()
     */
    func clone()->CGRect{
        return CGRect(self.origin.x,self.origin.y,self.width,self.height)
    }
    /**
     * Create a path using the coordinates of the rect passed in
     * EXAMPLE: CGRect(0,0,100,100).path
     */
    var path:CGMutablePath{return CGRectParser.path(self)}
}
/*Convenient extensions*/
extension CGRect{
    /*Initialization*/
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat){ self.origin = CGPoint(x,y); self.size = CGSize( width, height);}//TODO:add initializer to CGSize
    init(_ x:Double,_ y:Double,_ width:Double,_ height:Double){ self.origin = CGPoint(x,y); self.size = CGSize( width, height);}//TODO:add initializer to CGSize
    init(_ x:CGFloat,_ y:CGFloat,_ width:Double,_ height:Double){ self.origin = CGPoint(x,y); self.size = CGSize(width,height);}
    init(_ x:Int,_ y:Int,_ width:Double,_ height:Double){ self.origin = CGPoint(x,y); self.size = CGSize(width,height);}
    /*Position*/
    var x:CGFloat {set {origin.x = newValue} get {return origin.x} }
    var y:CGFloat {set {origin.y = newValue} get {return origin.y} }
    /*Size*/
    var width:CGFloat {set {size.width = newValue} get {return size.width} }
    var height:CGFloat {set {size.height = newValue} get {return size.height} }
    /*Corners*/
    var topLeft:CGPoint {get {return self.origin} }
    var bottomLeft:CGPoint {get {return CGPoint(self.minX, self.maxY)}}
    var bottomRight:CGPoint {get {return CGPoint(self.maxX, self.maxY)}}
    var topRight:CGPoint {get {return CGPoint(self.maxX, self.minY)}}
    var center:CGPoint {get {return CGPoint(self.midX, self.midY)}}
    var top:CGPoint {get {return CGPoint(self.midX, self.minY)}}
    var bottom:CGPoint {get {return CGPoint(self.midX, self.maxY)}}
    var left:CGPoint {get {return CGPoint(self.maxX, self.midY)}}
    var right:CGPoint {get {return CGPoint(self.minX, self.midY)}}
    var corners:Array<CGPoint> {return [self.topLeft,self.topRight,self.bottomLeft,self.bottomRight]}
    /*Easy Access to corners*/
    subscript(key: String) -> CGPoint {
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
            fatalError("UNSUPORTED CORNER TYPE: " + key + " WITH VALUE: " + String(newValue))
        }
    }
    //TODO:  support for double and int aswell, also for x,y
    /**
     * negative inset equals outset
     */
    func outset(dx:CGFloat,_ dy:CGFloat)->CGRect{
        return insetBy(dx: -dx, dy: -dy)
    }
}



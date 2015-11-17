import Foundation

extension CGRect {
    /**
     * Clones CGRect
     * EXAMPLE: CGRect(0,0,100,100).clone()
     */
    func clone()->CGRect{
        return CGRect(self.origin.x,self.origin.y,self.width,self.height)
    }
}
/*Convenient extensions*/
extension CGRect{
    /*Initialization*/
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat){ self.origin = CGPoint(x,y); self.size = CGSize(width: width,height: height);}//TODO:add initializer to CGSize
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
    /*Easy Access to corners*/
    subscript(key: String) -> CGPoint {
        get {
            switch key{
               case Alignment.topLeft:return topLeft
               case Alignment.topRight:return topLeft
               case Alignment.bottomRight:return topLeft
               case Alignment.bottomLeft:return topLeft
               case Alignment.top:return topLeft
               case Alignment.bottom:return topLeft
               case Alignment.left:return topLeft
               case Alignment.right:return topLeft
               case Alignment.center:return topLeft
               default:fatalError("UNSUPORTED CORNER TYPE: " + key)
            }
        }
        set {
            fatalError("UNSUPORTED CORNER TYPE: " + key + " WITH VALUE: " + String(newValue))
        }
    }
    //TODO:  support for double and int aswell, also for x,y
}



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
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat){
        self.origin = CGPoint(x,y)
        self.size = CGSize(width: width,height: height)//add initializer to CGSize
    }
    var x:CGFloat {set {origin.x = newValue} get {return origin.x} }
    var y:CGFloat {set {origin.y = newValue} get {return origin.y} }
    var width:CGFloat {set {size.width = newValue} get {return size.width} }
    var height:CGFloat {set {size.height = newValue} get {return size.height} }
    
    var topLeft:CGPoint = CGRect
    //TODO:  support for double and int aswell, also for x,y
    
    /*
    subscript(key: String) -> String? {
        get {
            if key == "nid" {
                return nid
            } else if key == "title" {
                return title
            }
            return nil
        }
        set {
            if key == "nid" {
                nid = newValue
            } else if key == "title" {
                title = newValue
            }
        }
    }
    */
}



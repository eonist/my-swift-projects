import Foundation

extension CGRect {
    /**
     *
     */
    func clone()->CGRect{
        return CGRect(self.origin.x,self.origin.y,self.width,self.height)
    }
}
extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat){
        init(x: x,y: y,width: width,height: height)
    }
}

//make the conventient init with x,y etc and also implement x,y as get values
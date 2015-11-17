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
        self.origin = CGPoint(x,y)
        self.size = CGSize(width: width,height: height)//add initializer to CGSize
    }
}

//make the conventient init with x,y etc and also implement x,y as get values
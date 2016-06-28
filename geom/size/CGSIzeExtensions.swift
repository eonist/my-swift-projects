import Foundation
/*Convenient extensions*/
extension CGSize {
    /*Initialization*/
    init(_ width:CGFloat,_ height:CGFloat){self.width = width;self.height = height;}
    init(_ width:Double,_ height:Double){self.width = CGFloat(width);self.height = CGFloat(height);}
    init(_ width:Int,_ height:Int){self.width = CGFloat(width);self.height = CGFloat(height);}
}
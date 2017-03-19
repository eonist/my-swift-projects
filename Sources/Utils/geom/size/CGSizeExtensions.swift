import Foundation
/*Convenient extensions*/
extension CGSize {
    init(_ width:CGFloat,_ height:CGFloat){self.width = width;self.height = height}
    init(_ width:Double,_ height:Double){self.width = CGFloat(width);self.height = CGFloat(height)}
    init(_ width:Int,_ height:Int){self.width = CGFloat(width);self.height = CGFloat(height)}
    var w:CGFloat {set {self.width = newValue} get {return self.width}}
    var h:CGFloat {set {self.height = newValue} get {return self.height}}
}
public func +(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width + b.width,a.height + b.height)}
public func -(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width - b.width,a.height - b.height)}
public func +=( a: inout CGSize, b: CGSize) {a.width += b.width;a.height += b.height;}/*modifies a by adding b*/
public func -=( a: inout CGSize, b: CGSize) {a.width -= b.width;a.height -= b.height;}/*modifies a by subtracting b*/

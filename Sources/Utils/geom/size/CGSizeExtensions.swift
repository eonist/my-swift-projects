import Foundation
/*Convenient extensions*/
extension CGSize {
    init(_ width:CGFloat,_ height:CGFloat){self.width = width;self.height = height}
    init(_ width:Double,_ height:Double){self.width = CGFloat(width);self.height = CGFloat(height)}
    init(_ width:Int,_ height:Int){self.width = CGFloat(width);self.height = CGFloat(height)}
    var w:CGFloat {set {self.width = newValue} get {return self.width}}
    var h:CGFloat {set {self.height = newValue} get {return self.height}}
    
    subscript(dir:Dir) -> CGFloat {/*Convenience*/
        get {
            if(dir == .hor){
                return self.width
            }else if(dir == .ver){
                return self.height
            }else{fatalError("not supported")}
        }set {
            if(dir == .hor){
                self.width = newValue
            }else if(dir == .ver){
                self.height = newValue
            }else{fatalError("not supported")}
        }
    }
}
public func +(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width + b.width,a.height + b.height)}
public func -(a: CGSize, b: CGSize) -> CGSize { return CGSize(a.width - b.width,a.height - b.height)}
public func +=( a: inout CGSize, b: CGSize) {a.width += b.width;a.height += b.height}/*modifies a by adding b*/
public func -=( a: inout CGSize, b: CGSize) {a.width -= b.width;a.height -= b.height}/*modifies a by subtracting b*/

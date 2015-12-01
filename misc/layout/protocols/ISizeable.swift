import Foundation

protocol ISizeable {
    var size:CGSize {get set}
}
extension ISizeable{
    var width:CGFloat{get{return self.size.width} set{self.width = newValue}}
    var height:CGFloat{get{return self.size.height} set{self.height = newValue}}
    mutating func setSize(width:CGFloat,height:CGFloat){
        self.width = width
        self.height = height
    }
    mutating func setSize(size:CGSize){
        self.width = size.width
        self.height = size.height
    }
    func getSize() -> CGSize {
        return size
    }
}

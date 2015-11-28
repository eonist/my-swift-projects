import Foundation

protocol ISizeable {
    var size:CGSize {get set}
    var width:CGFloat{get set}
    var height:CGFloat{get set}
}
extension ISizeable{
    mutating func setSize(size:CGSize){
        self.width = size.width
        self.height = size.height
    }
    mutating func setSize(width:CGFloat,height:CGFloat){
        self.width = width
        self.height = height
    }
    func getSize()->CGSize{
        return CGSize(self.width,self.height)
    }
}

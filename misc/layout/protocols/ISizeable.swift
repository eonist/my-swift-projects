import Foundation

protocol ISizeable {
    var width:CGFloat{get set}
    var height:CGFloat{get set}
}
extension ISizeable{
    mutating func setSize(point:CGSize){
        self.width = point.width
        self.height = point.height
    }
    func getSize()->CGSize{
        return CGSize(self.width,self.height)
    }
}

import Foundation

protocol IPositionable {
    var position:CGPoint{get set}
}
extension IPositionable{
    var x:CGFloat{get{return self.position.x} set{self.position.x = newValue}}
    var y:CGFloat{get{return self.position.y} set{self.position.y = newValue}}
    mutating func setPosition(x:CGFloat,y:CGFloat){
        self.x = x
        self.y = y
    }
}

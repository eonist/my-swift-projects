import Foundation

protocol IPositionable {
    var x:CGFloat{get set}
    var y:CGFloat{get set}
}
extension IPositionable{
    mutating func setPosition(point:CGPoint){
        self.x = point.x
        self.y = point.y
    }
    func getPosition()->CGPoint{
        return CGPoint(self.x,self.y)
    }
}

import Foundation

class Point {
    var x:Double
    var y:Double
    init(x:Double = 0, y:Double = 0){
        self.x = x
        self.y = y
    }
}
extension Point{
    /**
     *
     */
    func add(p:Point){
        x += p.x
        y += p.y
    }
    func subtract(p:Point){
        x -= p.x
        y -= p.y
    }
}
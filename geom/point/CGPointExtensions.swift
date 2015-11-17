import Foundation

extension CGPoint{
    /**
     *
     */
    mutating func add(p:CGPoint){
        x += p.x
        y += p.y
    }
    mutating func subtract(p:CGPoint){
        x -= p.x
        y -= p.y
    }
}

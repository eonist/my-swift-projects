import Foundation

extension CGPoint{
    /**
     *
     */
    mutating func add(p:CGPoint)->CGPoint{
        x += p.x
        y += p.y
        return self
    }
    mutating func subtract(p:CGPoint)->CGPoint{
        x -= p.x
        y -= p.y
        return self
    }
}

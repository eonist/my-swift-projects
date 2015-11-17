import Foundation

extension CGPoint{
    /**
     *
     */
    func add(p:CGPoint)->CGPoint{
        return CGPointMake(x + p.x, y + p.y)
    }
    /**
     *
     */
    func subtract(p:CGPoint)->CGPoint{
        return CGPointMake(x - p.x, y - p.y)
    }
}

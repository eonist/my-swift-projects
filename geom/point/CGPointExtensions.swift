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
    // Extend `CGPoint` to add an initializer from a `float2` representation of a point.
    
    // MARK: Initializers
    
    /// Initialize with a `float2` type.
    init(_ x: Double, _ y:Double) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
    }

}

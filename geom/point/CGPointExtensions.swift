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
    /**
     * Init a CGPoint with Double values
     */
    init(_ x: Double, _ y:Double) {
        self.x = CGFloat(x)
        self.y = CGFloat(y)
    }
}

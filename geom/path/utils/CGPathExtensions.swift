import Foundation

extension CGMutablePath{
    /**
     * Note its probably better to move this method into the Graphic class since then it can be overriden by subclasses, which you cant do with this extension method, really?
     */
    func add(path:CGPath){
        CGPathAddPath(self, nil, path)
    }
    /**
     * Returns a copy of it self
     */
    func copy()->CGMutablePathRef {//possibly return CGMutablePathRef
        return CGPathCreateMutableCopy(self)!
    }
    /**
     * Convenince
     */
    func moveTo(x: CGFloat, _ y: CGFloat){
        CGPathMoveToPoint(self, nil, x, y)
    }
    /**
     * Convenince
     */
    func moveTo(point: CGPoint){
        CGPathMoveToPoint(self, nil, point.x, point.y)
    }
    /**
     * Convenince
     */
    func addRelativeArc(center:CGPoint,_ xRadii:CGFloat,_ startAngle:CGFloat,_ delta:CGFloat, _ matrix: UnsafePointer<CGAffineTransform>){
        CGPathAddRelativeArc(self, matrix, center.x, center.y, xRadii, startAngle, delta)
    }
}
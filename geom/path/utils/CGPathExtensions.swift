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
     *
     */
    func moveTo(path: CGMutablePath?, _ x: CGFloat, _ y: CGFloat){
        CGPathMoveToPoint(path, nil, x, y)
    }
    /**
     *
     */
    func moveTo(path: CGMutablePath?, _ point: CGPoint){
        CGPathMoveToPoint(path, nil, point.x, point.y)
    }
}
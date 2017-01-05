import Foundation

extension CGMutablePath{
    /**
     * NOTE: its probably better to move this method into the Graphic class since then it can be overriden by subclasses, which you cant do with this extension method, really?
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
    func moveTo(x: CGFloat, _ y: CGFloat){/*Convenince*/
        CGPathMoveToPoint(self, nil, x, y)
    }
    func moveTo(point: CGPoint){/*Convenince*/
        CGPathMoveToPoint(self, nil, point.x, point.y)
    }
    /**
     * Convenince
     * NOTE: If `delta' is positive, then the arc is drawn counter-clockwise; if negative, clockwise.
     */
    func addRelativeArc(center:CGPoint,_ xRadii:CGFloat,_ startAngle:CGFloat,_ delta:CGFloat, _ matrix: UnsafePointer<CGAffineTransform>){
        CGPathAddRelativeArc(self, matrix, center.x, center.y, xRadii, startAngle, delta)
    }
}
extension CGPath {
    func forEach(@noescape body: @convention(block) (CGPathElement) -> Void) {
        typealias Body = @convention(block) (CGPathElement) -> Void
        func callback(info: UnsafeMutablePointer<Void>, element: UnsafePointer<CGPathElement>) {
            let body = unsafeBitCast(info, Body.self)
            body(element.memory)
        }
        print(sizeofValue(body))
        let unsafeBody = unsafeBitCast(body, UnsafeMutablePointer<Void>.self)
        CGPathApply(self, unsafeBody, callback)
    }
}
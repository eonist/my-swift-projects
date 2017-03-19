import Foundation

extension CGMutablePath{
    /**
     * NOTE: its probably better to move this method into the Graphic class since then it can be overriden by subclasses, which you cant do with this extension method, really?
     */
    func add(_ path:CGPath){
        self.add(path)//swift 3 update
    }
    /**
     * Returns a copy of it self
     * NOTE: this was previously copy, but swift 3 uses this method
     */
    func clone()->CGMutablePath {
        return self.mutableCopy()!
    }
    func moveTo(_ x: CGFloat, _ y: CGFloat){/*Convenince*/
        self.move(to: CGPoint(x,y))
    }
    func moveTo(_ point: CGPoint){/*Convenince*/
        self.move(to: point)
    }
    /**
     * Convenince
     * NOTE: If `delta' is positive, then the arc is drawn counter-clockwise; if negative, clockwise.
     */
    func addRelativeArc(_ center:CGPoint,_ xRadii:CGFloat,_ startAngle:CGFloat,_ delta:CGFloat, _ matrix: CGAffineTransform){
        self.addRelativeArc(center: center, radius: xRadii, startAngle: startAngle, delta: delta, transform: matrix)//swift 3 updated
    }
}
extension CGPath {
    /**
     * NOTE: this method is used in DrawLab when Converting CGPath to Path
     * NOTE: Great method for parsing through CGPath instances 
     * TODO: swift 3 update, this method changed drastically, I think Oleb from obj-c.io has a swift 3 version of this that is better.
     */
    func forEach( body: @convention(block) (CGPathElement) -> Void) {
        typealias Body = @convention(block) (CGPathElement) -> Void
        func callback(info: UnsafeMutableRawPointer, element: UnsafePointer<CGPathElement>) {
            let body = unsafeBitCast(info, to: Body.self)
            body(element.pointee)
        }
        Swift.print(MemoryLayout.size(ofValue: body))
        let unsafeBody = unsafeBitCast(body, to: UnsafeMutableRawPointer.self)
        self.apply(info: unsafeBody, function: callback as! CGPathApplierFunction)
    }
}
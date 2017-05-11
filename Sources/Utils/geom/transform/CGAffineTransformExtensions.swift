import Foundation
/**
 * Make an alias named Transform even?
 */
typealias CGTransform = CGAffineTransform/*Convenience*/
extension CGAffineTransform {
    mutating func rotate(_ rotation:CGFloat){/*Convenience*/
        self = self.rotated(by: rotation)//was-> CGAffineTransformRotate
    }
    mutating func scale(_ xScale:CGFloat,_ yScale:CGFloat){/*Convenience*/
        self = self.scaledBy(x: xScale, y: yScale)//->CGAffineTransformScale
    }
    mutating func translate(_ x:CGFloat,_ y:CGFloat){/*Convenience*/
        self = self.translatedBy(x: x, y: y)//-> CGAffineTransformTranslate
    }
    mutating func rotateAroundPoint(_ rotation:CGFloat, _ pivot:CGPoint){/*Convenience*/
        self = CGTransform.rotateAroundPoint(self, rotation,pivot)
    }
    mutating func scaleFromPoint(_ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint){/*Convenience*/
        self = CGTransform.scaleFromPoint(self, xScale,yScale,pivot)
    }
    /**
     * Scales a matrix and returns the result. The skewSide parameter lets the user determine which side to skew (right or bottom).
     */
    mutating func skew(_ transform:CGAffineTransform, angle:CGFloat, skewSide:String = "right"){
        //see old code for this implementation
    }
    static func rotateAroundPoint(_ transform:CGTransform,_ rotation:CGFloat,_ pivot:CGPoint)->CGTransform{
        return CGAffineTransformParser.rotateAroundPoint(transform, rotation, pivot)
    }
    static func scaleFromPoint(_ transform:CGTransform, _ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint)->CGTransform{
        return CGAffineTransformParser.scaleFromPoint(transform, xScale, yScale, pivot)
    }
    static func translate(_ transform:CGTransform,_ x:CGFloat,_ y:CGFloat)->CGAffineTransform{
        return CGAffineTransformParser.translate(transform, x, y)
    }
    static func transformAroundPoint(_ transform:CGTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint)->CGTransform{
        return CGAffineTransformParser.transformAroundPoint(transform, scale, rotation, offset, pivot)
    }
    static func transformWithPivot(_ transform:inout CGTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        _ = CGAffineTransformModifier.transformWithPivot(&transform,scale,rotation,offset,pivot,initRotation)
    }
    static func copy(_ transform:CGTransform)->CGTransform{
        return CGAffineTransformParser.copy(transform)
    }
    mutating func concat(_ transformation:CGTransform){
        self = CGAffineTransformParser.concat(self, transformation)
    }
    static func concat(_ a:CGTransform,_ b:CGTransform)->CGTransform{
        return CGAffineTransformParser.concat(a, b)
    }
    func copy()->CGTransform{
        return CGAffineTransformParser.copy(self)
    }
    func transformPoint(_ point:CGPoint) -> CGPoint{
        return CGAffineTransformModifier.transformPoint(point, self)
    }
    var id:String{return a.string + "," + b.string + "," + c.string + "," + d.string + "," + tx.string + "," + ty.string }//a,b,c,d,tx,ty /*Reflection uses this variable*/
    /**
     * Simpler init
     * CAUTION: This is not the same as .identity
     */
    init(_ a:CGFloat,_ b:CGFloat,_ c:CGFloat,_ d:CGFloat,_ tx:CGFloat, _ ty:CGFloat){/*0.0 - 1.0*/
        self.init(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
}

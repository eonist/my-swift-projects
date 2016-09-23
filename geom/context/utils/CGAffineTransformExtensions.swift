import Foundation
typealias CGTransform = CGAffineTransform/*Convenience*/
extension CGAffineTransform {
    /**
     *
     */
    mutating func rotate(rotation:CGFloat){/*Convenience*/
        self = CGAffineTransformRotate(self, rotation)
    }
    mutating func scale(xScale:CGFloat,_ yScale:CGFloat){/*Convenience*/
        self = CGAffineTransformScale(self, xScale, yScale)
    }
    mutating func translate(x:CGFloat,_ y:CGFloat){/*Convenience*/
        self = CGAffineTransformTranslate(self, x, y)
    }
    mutating func rotateAroundPoint(rotation:CGFloat, _ pivot:CGPoint){/*Convenience*/
        self = CGTransform.rotateAroundPoint(self, rotation,pivot)
    }
    mutating func scaleFromPoint(xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint){/*Convenience*/
        self = CGTransform.scaleFromPoint(self, xScale,yScale,pivot)
    }
    /**
     * Scales a matrix and returns the result. The skewSide parameter lets the user determine which side to skew (right or bottom).
     */
    mutating func skew(transform:CGAffineTransform, angle:CGFloat, skewSide:String = "right"){
        //see old code for this implementation
    }
    
    static func rotateAroundPoint(transform:CGTransform,_ rotation:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        return CGAffineTransformParser.rotateAroundPoint(transform, rotation, pivot)
    }
    static func scaleFromPoint(transform:CGTransform, _ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        return CGAffineTransformParser.scaleFromPoint(transform, xScale, yScale, pivot)
    }
    static func translate(transform:CGTransform,_ x:CGFloat,_ y:CGFloat)->CGAffineTransform{
        return CGAffineTransformParser.translate(transform, x, y)
    }
    static func transformAroundPoint(transform:CGTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint)->CGAffineTransform{
        return CGAffineTransformParser.transformAroundPoint(transform, scale, rotation, offset, pivot)
    }
    static func transformWithPivot(inout transform:CGTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        CGAffineTransformModifier.transformWithPivot(&transform,scale,rotation,offset,pivot,initRotation)
    }
    static func copy(transform:CGTransform)->CGTransform{
        return CGAffineTransformParser.copy(transform)
    }
    /**
     *
     */
    mutating func concat(transformation:CGTransform){
        self = CGAffineTransformParser.concat(self, transformation)
    }
    /**
     *
     */
    static func concat(a:CGTransform,_ b:CGTransform)->CGTransform{
        return CGAffineTransformParser.concat(a, b)
    }
    /**
     *
     */
    func copy()->CGTransform{
        return CGAffineTransformParser.copy(self)
    }
    func transformPoint(point:CGPoint) -> CGPoint{
        return CGAffineTransformModifier.transformPoint(point, self)
    }
    var identity:String{return a.string + b.string + c.string + d.string + tx.string + ty.string }////a,b,c,d,tx,ty
}
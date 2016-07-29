import Foundation

extension CGAffineTransform {
    /**
     *
     */
    mutating func rotate(rotation:CGFloat){
        self = CGAffineTransformRotate(self, rotation)
    }
    mutating func scale(xScale:CGFloat,_ yScale:CGFloat){
        self = CGAffineTransformScale(self, xScale, yScale)
    }
    mutating func translate(x:CGFloat,_ y:CGFloat){
        self = CGAffineTransformTranslate(self, x, y)
    }
    mutating func rotateAroundPoint(rotation:CGFloat, _ pivot:CGPoint){
        self = CGAffineTransform.rotateAroundPoint(self, rotation,pivot)
    }
    mutating func scaleFromPoint(xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint){
        self = CGAffineTransform.scaleFromPoint(self, xScale,yScale,pivot)
    }
    /**
     * Scales a matrix and returns the result. The skewSide parameter lets the user determine which side to skew (right or bottom).
     */
    mutating func skew(transform:CGAffineTransform, angle:CGFloat, skewSide:String = "right"){
        //see old code for this implementation
    }
    
    static func rotateAroundPoint(transform:CGAffineTransform,_ rotation:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        return CGAffineTransformParser.rotateAroundPoint(transform, rotation, pivot)
    }
    static func scaleFromPoint(transform:CGAffineTransform, _ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        return CGAffineTransformParser.scaleFromPoint(transform, xScale, yScale, pivot)
    }
    static func translate(transform:CGAffineTransform,_ x:CGFloat,_ y:CGFloat)->CGAffineTransform{
        return CGAffineTransformParser.translate(transform, x, y)
    }
    static func transformAroundPoint(transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint)->CGAffineTransform{
        return CGAffineTransformParser.transformAroundPoint(transform, scale, rotation, offset, pivot)
    }
    static func transformWithPivot(inout transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        CGAffineTransformModifier.transformWithPivot(&transform,scale,rotation,offset,pivot,initRotation)
    }
    static func copy(transform:CGAffineTransform)->CGAffineTransform{
        return CGAffineTransformParser.copy(transform)
    }
    /**
     *
     */
    mutating func concat(transformation:CGAffineTransform){
        self = CGAffineTransformParser.concat(self, transformation)
    }
    /**
     *
     */
    static func concat(a:CGAffineTransform,_ b:CGAffineTransform)->CGAffineTransform{
        return CGAffineTransformParser.concat(a, b)
    }
    /**
     *
     */
    func copy()->CGAffineTransform{
        return CGAffineTransformParser.copy(self)
    }
    func transformPoint(point:CGPoint) -> CGPoint{
        return CGAffineTransformModifier.transformPoint(point, self)
    }
}
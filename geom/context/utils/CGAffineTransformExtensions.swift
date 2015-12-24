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
        CGAffineTransform.rotateAroundPoint(&self, rotation,pivot)
    }
    mutating func scaleFromPoint(xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint){
        CGAffineTransform.scaleFromPoint(&self, xScale,yScale,pivot)
    }
    /**
     * Scales a matrix and returns the result. The skewSide parameter lets the user determine which side to skew (right or bottom).
     */
    mutating func skew(transform:CGAffineTransform, angle:CGFloat, skewSide:String = "right"){
        //see old code for this implementation
    }
    /**
     * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
     * NOTE: The equivelent code in Matrix Trasform form: //let transform:CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
     * // :TODO: we could return the matrix for method chaining
     * // :TODO: rename to just rotate? for simplicity?
     */
    static func rotateAroundPoint(inout transform:CGAffineTransform,_ rotation:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        transform.translate(pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        transform.rotate(rotation)// = CGAffineTransformRotate(transform, rotation);
        transform.translate(-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
        return transform
    }
    /**
     *
     */
    static func scaleFromPoint(inout transform:CGAffineTransform, _ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        transform.translate(pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        transform.scale(xScale,yScale)// = CGAffineTransformRotate(transform, rotation);
        transform.translate(-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
        return transform
    }
    /**
     * NOTE: The result may vary if you change the order of how the translations are applied. This method does not work if you need to rotate and scale around a point for instance, then you need to change the order
     */
    static func transformWithPivot(inout transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        transform = CGAffineTransformTranslate(transform, pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        if(initRotation != 0) {transform.rotate( -initRotation)}
        transform.scale(scale.x, scale.y);
        transform.rotate(rotation);
        transform.translate(-pivot.x+offset.x, -pivot.y+offset.y);/*globalToLocal*/
    }
}

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
    /**
     *
     */
    mutating func concat(transformation:CGAffineTransform){
        self = CGAffineTransform.concat(self, transformation)
    }
    /**
     * 
     */
    func copy()->CGAffineTransform{
        return CGAffineTransform.copy(self)
    }
    /**
     * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
     * NOTE: The equivelent code in Matrix Trasform form: //let transform:CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
     * // :TODO: we could return the matrix for method chaining
     * // :TODO: rename to just rotate? for simplicity?
     */
    static func rotateAroundPoint(var transform:CGAffineTransform,_ rotation:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        transform.translate(pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        transform.rotate(rotation)// = CGAffineTransformRotate(transform, rotation);
        transform.translate(-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
        return transform
    }
    /**
     * NOTE: You can chain scaleFromPoint and rotatAroundPoint and eventually skewFromPoint. This is a great way to get different transform results quickly
     */
    static func scaleFromPoint(var transform:CGAffineTransform, _ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint)->CGAffineTransform{
        transform.translate(pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        transform.scale(xScale,yScale)// = CGAffineTransformRotate(transform, rotation);
        transform.translate(-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
        return transform
    }
    /**
     *
     */
    static func translate(var transform:CGAffineTransform,_ x:CGFloat,_ y:CGFloat)->CGAffineTransform{
        transform.translate(x, y);
        return transform
    }
    /**
     * NOTE: this method is used in conjunction with the radial gradient matrix transformation of context
     * NOTE: the special thing about it is that the scale value follows the axis of the rotation. defualt rotation is 0 and thus scale.y becomes the width sort of
     */
    static func transformAroundPoint(var transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint)->CGAffineTransform{
        transform = CGAffineTransform.translate(transform,offset.x,offset.y)//transform,minRadius*gradient.relativeStartCenter!.x,minRadius*gradient.relativeStartCenter!.y
        transform = CGAffineTransform.rotateAroundPoint(transform, rotation, pivot)
        transform = CGAffineTransform.scaleFromPoint(transform, scale.y/**/,  scale.x/**/, pivot)
        return transform
    }
    /**
     * NOTE: The result may vary if you change the order of how the translations are applied. This method does not work if you need to rotate and scale around a point for instance, then you need to change the order
     * NOTE: its prefreable to chain the methods bellow. so if yoou need other variations of this method. You may want to just chain some transform calls instead
     */
    static func transformWithPivot(inout transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        transform = CGAffineTransformTranslate(transform, pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        if(initRotation != 0) {transform.rotate( -initRotation)}
        transform.scale(scale.x, scale.y);
        transform.rotate(rotation);
        transform.translate(-pivot.x+offset.x, -pivot.y+offset.y);/*globalToLocal*/
    }
    /**
     *
     */
    static func copy(transform:CGAffineTransform)->CGAffineTransform{
        return CGAffineTransformMake(transform.a, transform.b, transform.c, transform.d, transform.tx, transform.ty)//radialGradient.gradientTransform
    }
    /**
     *
     */
    static func concat(a:CGAffineTransform,_ b:CGAffineTransform)->CGAffineTransform{
        return CGAffineTransformConcat(a, b)
    }
    /**
     *
     */
    static func transformPoint(point:CGPoint){
        
    }
}
import Foundation

extension CGAffineTransform {
    /**
     *
     */
    mutating func rotate(rotation:CGFloat){
        self = CGAffineTransformRotate(self, rotation)
    }
    /**
     * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
     * NOTE: The equivelent code in Matrix Trasform form: //let transform:CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
     * // :TODO: we could return the matrix for method chaining
     * // :TODO: rename to just rotate? for simplicity?
     */
    static func rotateAroundExternalPoint(inout transform:CGAffineTransform,_ pivot:CGPoint, _ rotation:CGFloat){
        transform = CGAffineTransformTranslate(transform, pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        transform.rotate(rotation)// = CGAffineTransformRotate(transform, rotation);
        transform = CGAffineTransformTranslate(transform,-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
    }
    /**
    *
    */
    
    
    static func transformWithPivot(inout transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGFloat, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        /*
        transform = CGAffineTransformTranslate(transform, pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        if(initRotation != 0) {CGAffineTransformRotate(transform, -initRotation)}
        matrix.scale(scale.x, scale.y);
        matrix.rotate(rotation);
        matrix.translate(pivot.x+offset.x, pivot.y+offset.y);/*globalToLocal*/
        return matrix;
        */
    }
}

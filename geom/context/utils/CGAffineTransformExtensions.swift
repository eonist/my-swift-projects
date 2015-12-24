import Foundation

extension CGAffineTransform {
    /**
     * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
     * NOTE: The equivelent code in Matrix Trasform form: //let transform:CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
     * // :TODO: we could return the matrix for method chaining
     * // :TODO: rename to just rotate? for simplicity?
     */
    mutating static func rotateAroundExternalPoint(inout transform:CGAffineTransform,_ pivot:CGPoint, _ rotation:CGFloat){
        transform = CGAffineTransformTranslate(transform, pivot.x, pivot.y)
        transform = CGAffineTransformRotate(transform, rotation);
        transform = CGAffineTransformTranslate(transform,-pivot.x,-pivot.y);
    }
}

import Foundation

extension CGAffineTransform {
    /**
     * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
     * NOTE: The equivelent code in Matrix Trasform form: //let transform:CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
     * // :TODO: we could return the matrix for method chaining
     * // :TODO: rename to just rotate? for simplicity?
     */
    static func rotateAroundExternalPoint(transform:CGAffineTransform, pivot:CGPoint, rotation:CGFloat){
        /*
        var transform:CGAffineTransform = CGAffineTransformMakeTranslation(x, y);
        transform = CGAffineTransformRotate(transform, a);
        transform = CGAffineTransformTranslate(transform,-x,-y);
        transform
        */
    }
}

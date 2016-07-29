import Foundation

class PositionalModifier {
    /**
     * Rotates positionals
     */
    class func rotate(positionals:Array<IPositional>, _ pivot:CGPoint, _ rotation:CGFloat) {
        var matrix:CGAffineTransform = CGAffineTransformIdentity
        matrix.rotateAroundPoint(rotation, pivot)//MatrixModifier.rotateAroundExternalPoint(matrix, pivot, rotation);
        for positional:IPositional in positionals {
            var point:CGPoint = positional.getPosition()
            point = matrix.transformPoint(point)
            positional.setPosition(point)
        }
    }
    /**
     * Position instances of IPositional
     */
    class func position(positionals:Array<IPositional>,_ positions:Array<CGPoint>) {
        let positionalCount:Int = positionals.count
        for (var i : Int = 0; i < positionalCount; i++) {positionals[i].setPosition(positions[i])}
    }
    /**
     *
     */
    class func transform(positionals:Array<IPositional>, _ initPositions:Array<CGPoint>, _ matrix:CGAffineTransform) {
        let positionalCount:Int = positionals.count
        for (var i : Int = 0; i < positionalCount; i++) { positionals[i].setPosition(CGPointApplyAffineTransform(initPositions[i], matrix)) }
    }
}

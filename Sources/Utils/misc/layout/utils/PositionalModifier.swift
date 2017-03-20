import Foundation

class PositionalModifier {
    /**
     * Rotates positionals
     */
    static func rotate(_ positionals:[IPositional], _ pivot:CGPoint, _ rotation:CGFloat) {
        var matrix:CGTransform = CGTransform.identity
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
    static func position(_ positionals:[IPositional],_ positions:[CGPoint]) {
        for i in 0..<positionals.count {/*<--recently updated to swift 3 style for loop syntax*/
            positionals[i].setPosition(positions[i])
        }
    }
    /**
     *
     */
    static func transform(_ positionals:[IPositional], _ initPositions:[CGPoint], _ matrix:CGTransform) {
        for i in 0..<positionals.count{//<-recently updated to swift 3 style for loop syntax
            positionals[i].setPosition(matrix.transformPoint(initPositions[i])) 
        }
    }
}
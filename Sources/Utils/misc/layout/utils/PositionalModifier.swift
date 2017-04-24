import Foundation

class PositionalModifier {
    /**
     * Rotates positionals
     */
    static func rotate(_ positionals:[IPositional], _ pivot:CGPoint, _ rotation:CGFloat) {
        var matrix:CGTransform = CGTransform.identity
        matrix.rotateAroundPoint(rotation, pivot)//MatrixModifier.rotateAroundExternalPoint(matrix, pivot, rotation);
        positionals.forEach { positional in
            let point:CGPoint = positional.getPosition()
            let p:CGPoint = matrix.transformPoint(point)
            positional.setPosition(p)
        }
    }
    /**
     * Position instances of IPositional
     * IMPORTANT: ⚠️️ PARAMS must be of equal array size
     */
    static func position(_ positionals:[IPositional],_ positions:[CGPoint]) {
        for i in 0..<positionals.count {
            positionals[i].setPosition(positions[i])
        }
    }
    /**
     * IMPORTANT: ⚠️️ PARAMS must be of equal array size
     */
    static func transform(_ positionals:[IPositional], _ initPositions:[CGPoint], _ matrix:CGTransform) {
        for i in 0..<positionals.count{//<-recently updated to swift 3 style for loop syntax
            positionals[i].setPosition(matrix.transformPoint(initPositions[i])) 
        }
    }
}

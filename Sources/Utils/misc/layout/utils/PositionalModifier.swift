import Foundation

class PositionalModifier {
    /**
     * Rotates positionals
     */
    static func rotate(_ positionals:[Positional], _ pivot:CGPoint, _ rotation:CGFloat) {
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
    static func position(_ positionals:[Positional],_ positions:[CGPoint]) {
        (0..<positionals.count).indices.forEach { i in
            positionals[i].setPosition(positions[i])
        }
    }
    /**
     * IMPORTANT: ⚠️️ PARAMS must be of equal array size
     */
    static func transform(_ positionals:[Positional], _ initPositions:[CGPoint], _ matrix:CGTransform) {
        (0..<positionals.count).indices.forEach { i in//<-recently updated to swift 3 style for loop syntax
            positionals[i].setPosition(matrix.transformPoint(initPositions[i])) 
        }
    }
}

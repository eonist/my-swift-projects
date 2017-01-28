import Foundation

class TrigConverter {
    /**
     * Needs code
     */
    static func cartesianToPolar(_ point:CGPoint)->(radius:CGFloat,angle:CGFloat){
        /* do some math here to get radius and angle */
        let radius = CGFloat(0.0)
        let angle = CGFloat(0.0)
        return (radius,angle)
    }
    /**
     * Converts an angle in degrees to radians.
     * NOTE: its easier to just do: 45*㎭
     * NOTE: can also be defined: rad * (180 / π)
     */
    static func degrees(_ radians:CGFloat) -> CGFloat {
        return π * radians / 180.0
    }
    /**
     * Converts an angle in radians to degrees.
     * NOTE: can also be defined degrees * (π / 180)
     */
    static func radians(_ degrees:CGFloat) -> CGFloat {
        return degrees / 180.0 * π
    }
}
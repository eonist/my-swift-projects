import Foundation

class TrigUtils {
    /**
     * Returns an angle in Degrees
     * PARAM: angleType A string describing an angle in numeric value
     * RETURN: angle in degrees (0-360)
     */
    static func angleType(_ angleType:String)->CGFloat {
        if(angleType == "left") {return Trig.left}
        else if(angleType == "right") {return Trig.right}
        else if(angleType == "top") {return Trig.top}
        else {/*bottom*/ return Trig.bottom}
    }
}
import Foundation

class TrigUtils {
    /**
     * Returns an angle in Degrees
     * @param angleType A string describing an angle in numeric value
     * @return angle in degrees (0-360)
     */
    class func angleType(angleType:String)->CGFloat {
        if(angleType == "left") {return Trig.left}
        else if(angleType == "right") {return Trig.right}
        else if(angleType == "top") {return Trig.top}
        else {/*bottom*/ return Trig.bottom}
    }
}
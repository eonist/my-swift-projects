class Trig{
    static var left:Double = 180;
    static var right:Double = 0;
    static var bottom:Double = 90;
    static var top:Double = 270;
    static var rad:Double =  / 180;
    /**
     * Returns an angle in Degrees
     * @param angleType A string describing an angle in numeric value
     * @return angle in degrees (0-360)
     */
    class func angleType(angleType:String)->Double {
        if(angleType == "left") {return left}
        else if(angleType == "right") {return right}
        else if(angleType == "top") {return top}
        else {/*bottom*/ return bottom}
    }
}
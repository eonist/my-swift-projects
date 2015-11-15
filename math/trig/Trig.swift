class Trig{
    /**
    * Returns an angle in Degrees
    * @param angleType A string describing an angle in numeric value
    * @return angle in degrees (0-360)
    */
    class func angleType(angleType:String):Number {
        if(angleType == "left") return LEFT;
        else if(angleType == "right") return RIGHT;
        else if(angleType == "top") return TOP;
        else /*bottom*/ return BOTTOM;
    }
}
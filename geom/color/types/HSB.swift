import Foundation
class HSB {
    /**
     * The hue value for the HSB color. This represents an angle, in
     * degrees, around the HSB cone. The supplied value will be modulated
     * by 360 so that the stored value of hue will be in the range [0,360).
     * NOTE: If you set the h value: you should maybe use (newValue % 360)
     */
    var h : UInt;/*0-360*/
    /**
     * The saturation parameter for this HSB color. This is a value between
     * 0 (black) and 1 (full saturation), which represents the distance
     * from the center in the HSB cone.
     */
    var s : UInt;/*0-1*/
    /**
     * The brightness parameter for this HSB color. This is a value between
     * 0 (black) and 1 (full brightness), which represents the distance
     * from the apex of the HSB cone.
     */
    var b : UInt;/*0-1*/
    /**
     *  Constructs an HSBColor with optional parameters.
     *  @param hue The hue.
     *  @param saturation The saturation.
     *  @param brightness The brightness.
     */
    init(_ h:UInt = 0,_ s:UInt = 0,_ b:UInt = 0) {
        self.h = h;
        self.s = s;
        self.b = b;
    }
}
extension HSB{
    //continue here:
    var nsColor:NSColor {return }
}
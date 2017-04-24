import Cocoa
class HSB {
    /**
     * The hue value for the HSB color. This represents an angle, in
     * degrees, around the HSB cone. The supplied value will be modulated
     * by 360 so that the stored value of hue will be in the range [0,360).
     * NOTE: If you set the h value: you should maybe use (newValue % 360)
     */
    var h:CGFloat/*0-1 in reality its: 0-360*/
    /**
     * The saturation parameter for this HSB color. This is a value between
     * 0 (black) and 1 (full saturation), which represents the distance
     * from the center in the HSB cone.
     */
    var s:CGFloat/*0-1 in reality its: 0-100*/
    /**
     * The brightness parameter for this HSB color. This is a value between
     * 0 (black) and 1 (full brightness), which represents the distance
     * from the apex of the HSB cone.
     */
    var b:CGFloat/*0-1 in reality its: 0-100*/
    /**
     *  Constructs an HSBColor with optional parameters.
     *  PARAM: hue: The hue.
     *  PARAM: saturation: The saturation.
     *  PARAM: brightness: The brightness.
     */
    init(_ h:CGFloat = 0,_ s:CGFloat = 0,_ b:CGFloat = 0) {
        self.h = h
        self.s = s
        self.b = b
    }
}
extension HSB{
    var nsColor:NSColor {return NSColorParser.nsColor(self)}
    var rgb:RGB{return RGBParser.rgb(self)}
}

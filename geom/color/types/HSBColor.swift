import Foundation

class HSBColor {
    /**
     * The hue value for the HSB color. This represents an angle, in
     * degrees, around the HSB cone. The supplied value will be modulated
     * by 360 so that the stored value of hue will be in the range [0,360).
     */
    private var hueValue:CGFloat
    /**
     * The saturation parameter for this HSB color. This is a value between
     * 0 (black) and 1 (full saturation), which represents the distance
     * from the center in the HSB cone.
     */
    private var saturation:CGFloat
    /**
     * The brightness parameter for this HSB color. This is a value between
     * 0 (black) and 1 (full brightness), which represents the distance
     * from the apex of the HSB cone.
     */
    private var brightness:CGFloat
    /**
     *  Constructs an HSBColor with optional parameters.
     *  @param hue The hue.
     *  @param saturation The saturation.
     *  @param brightness The brightness.
     */
    init(_ hue:CGFloat = NaN, _ saturation:CGFloat = NaN, _ brightness:CGFloat = NaN) {
        self.hueValue = hue
        self.saturation = saturation
        self.brightness = brightness
    }
}
extension HSBColor{
    var hue:CGFloat{get{return self.hueValue}set{self.hueValue = newValue % 360}}
}
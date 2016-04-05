import Cocoa

class HSBParser {
    /**
     * Converts a color from RGB format into an HSBColor.
     * @param rgb The RGB color.
     * @return The HSBColor object representing the RGB color. Hue:0-360, Saturate:0-1, brightness:0-1
     */
    class func hsb(rgb:RGB)->HSB{
        return HSBParser.hsb(rgb.nsColor)
    }
    class func hsb(nsColor:NSColor)->HSB{
        return HSB(nsColor.hueComponent,nsColor.saturationComponent,nsColor.brightnessComponent)
    }
}
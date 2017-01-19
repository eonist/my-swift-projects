import Cocoa

class HSBParser {
    /**
     * Converts a color from RGB format into an HSBColor.
     * PARAM: rgb The RGB color.
     * RETURN: The HSBColor object representing the RGB color. Hue:0-360, Saturate:0-1, brightness:0-1
     */
    static func hsb(_ rgb:RGB)->HSB{
        return HSBParser.hsb(rgb.nsColor)
    }
    static func hsb(_ nsColor:NSColor)->HSB{
        return HSB(nsColor.hueComponent,nsColor.saturationComponent,nsColor.brightnessComponent)
    }
}

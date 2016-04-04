import Foundation

class HexModifier {
    /**
     * Blend two colors with a scalar ratio.
     * @param	first	The first color
     * @param	second	The second color
     * @param	ratio	The ratio of the second color to blend, .5 = equal ratio, .9 = 1:9, .2 = 8:2
     * @return	The color value as a uint.
     */
    class func blend(first:UInt, _ second:UInt, _ ratio:UInt) -> UInt {// :TODO: rename?
        var a:UInt; var b:UInt; var c:UInt;
        a = ((first & 0xff) * (1 - ratio) + (second & 0xff) * ratio);
        b = (((first & 0xff00) >> 8) * (1 - ratio) + ((second & 0xff00) >> 8) * ratio);
        c = (((first & 0xff0000) >> 16) * (1 - ratio) + ((second & 0xff0000) >> 16) * ratio);
        return UInt((a) | (b << 8) | (c << 16))
    }
    /**
     * Brighten (or darken) a color by a scalar amount.
     * @param	color	The color to brighten/darken.
     * @param	modifier	The scalar to modify the brightness, 0 = no change, ie. 0.9, 1.1
     * @return	The modified color
     */
    class func brighten(color:UInt, _ modifier:UInt) -> UInt {// :TODO: rename?
        let z:UInt = 0xff * modifier;
        var a:UInt; var b:UInt; var c:UInt;
        a = ((color & 0xff) + z)
        a = a > 0xFF ? 0xFF : ( a < 0 ? 0 : a)
        b = ((color & 0xff00) >> 8) + z
        b =  b > 0xFF ? 0xFF : ( b < 0 ? 0 : b)
        c = ((color & 0xff0000) >> 16) + z
        c =  c > 0xFF ? 0xFF : ( c < 0 ? 0 : c)
        return ((a) | (b << 8) | (c << 16))
    }
    /**
     * Desaturate a color by a scalar amount. (0-1)
     * This isn't a real desaturation, but blends the color with a neutral grey.
     * @param	color	The color to desaturate
     * @param	percent	The percentage of desaturation
     * @return	The desaturated color
     */
    class func desaturate(color:UInt, _ modifier:UInt)->UInt {
        return HexModifier.blend(color, 0x808080, modifier)
    }
    /**
     * Fades a color by a scalar amount. (0-1)
     * Basically just blends the color with white.
     * @param	color	The color to fade
     * @param	percent	The percentage of fade
     * @return	The faded color
     */
    class func fade(color:UInt, _ modifier:UInt) -> UInt {
        return blend(color, 0xFFFFFF, modifier);
    }
}
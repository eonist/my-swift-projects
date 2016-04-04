import Foundation

class HexModifier {
    /**
     * Blend two colors with a scalar ratio.
     * @param	first	The first color
     * @param	second	The second color
     * @param	ratio	The ratio of the second color to blend, .5 = equal ratio, .9 = 1:9, .2 = 8:2
     * @return	The color value as a uint.
     */
    class func blend(first:UInt, second:UInt, ratio:UInt) -> UInt {// :TODO: rename?
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
    class func brighten(color:UInt, modifier:UInt) -> UInt {
        // :TODO: rename?
        var z:UInt = 0xff * modifier;
        var a:UInt; var b:UInt; var c:UInt;
        a = (a = (color & 0xff) + z) > 0xFF ? 0xFF : ( a < 0 ? 0 : a)
        b = (b = ((color & 0xff00) >> 8) + z) > 0xFF ? 0xFF : ( b < 0 ? 0 : b)
        c = (c = ((color & 0xff0000) >> 16) + z) > 0xFF ? 0xFF : ( c < 0 ? 0 : c)
        return ((a) | (b << 8) | (c << 16))
    }
}
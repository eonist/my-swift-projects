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
}
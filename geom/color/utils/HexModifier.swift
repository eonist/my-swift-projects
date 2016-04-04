import Foundation

class HexModifier {
    /**
     * Blend two colors with a scalar ratio.
     * @param	first	The first color
     * @param	second	The second color
     * @param	ratio	The ratio of the second color to blend, .5 = equal ratio, .9 = 1:9, .2 = 8:2
     * @return	The color value as a uint.
     */
    class func blend(first:uint, second:uint, ratio:CGFloat) -> uint {
        // :TODO: rename?
        var a:CGFloat; var b:CGFloat; var c:CGFloat;
        a = ((first & 0xff) * (1 - ratio) + (second & 0xff) * ratio);
        b = (((first & 0xff00) >> 8) * (1 - ratio) + ((second & 0xff00) >> 8) * ratio);
        c = (((first & 0xff0000) >> 16) * (1 - ratio) + ((second & 0xff0000) >> 16) * ratio);
        return uint((a) | (b << 8) | (c << 16));
    }
}

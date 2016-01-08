import Foundation

class SVGRectParser {
    /**
     * Returns an Rectangle instance with data derived frompa svgRect
     * @Note: if the svgRect x and or y is of the value NaN, then these are transfered as 0
     */
    class func rectangle(svgRect:SVGRect)->CGRect {
        
        return CGRect(!svgRect.x.isNaN ? svgRect.x : 0, !svgRect.y.isNaN ? svgRect.y : 0, svgRect.width, svgRect.height);
    }
}

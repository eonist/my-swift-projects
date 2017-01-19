//this class can be removed

/*import Foundation

class SVGRectParser {
    /**
     * Returns an Rectangle instance with data derived from a svgRect
     * @Note: if the svgRect x and or y is of the value NaN, then these are transfered as 0
     */
    class func rectangle(svgRect:SVGRect)->CGRect {
        //Swift.print("svgRect: " + "\(svgRect)")
        //Swift.print("svgRect.x: " + "\(svgRect.x)")
        //Swift.print("svgRect.y: " + "\(svgRect.y)")
        //Swift.print("svgRect.width: " + "\(svgRect.width)")
        //Swift.print("svgRect.height: " + "\(svgRect.height)")
        return CGRect(!svgRect.x.isNaN ? svgRect.x : 0, !svgRect.y.isNaN ? svgRect.y : 0, svgRect.width, svgRect.height);
    }
}
*/
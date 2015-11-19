import Foundation

class FilletParser {
    /**
     * Returns a fillet configured to @param lineOffset and @param lineStyle
     */
    class func config(fillet:Fillet, offsetType:OffsetType, lineStyle:ILineStyle):Fillet {/* configure cornerRadius according to offsetType and lineStyle*/
        var tlr:CGFloat = configRadius(fillet.topLeft, offsetType.left || offsetType.top /*<--this last value is unrelevant since left will always be true*/, lineStyle);//TopLeftRadius
        var trr:CGFloat = configRadius(fillet.topRight, offsetType.right || offsetType.top, lineStyle);/*TopRightRadius*/
        var blr:CGFloat = configRadius(fillet.bottomLeft, offsetType.left || offsetType.bottom, lineStyle);/*BottomLeftRadius*/
        var brr:CGFloat = configRadius(fillet.bottomRight, offsetType.right || offsetType.bottom, lineStyle);/*BottomRightRadius*/
        return new Fillet(tlr,trr,blr,brr);
    }
}

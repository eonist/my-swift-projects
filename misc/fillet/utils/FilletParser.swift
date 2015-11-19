import Foundation

class FilletParser {
    /**
     * Returns a fillet configured to @param lineOffset and @param lineStyle
     */
    class func config(fillet:Fillet, offsetType:OffsetType, lineStyle:ILineStyle)->Fillet {/* configure cornerRadius according to offsetType and lineStyle*/
        var tlr:CGFloat = configRadius(fillet.topLeft, offsetType.left || offsetType.top /*<--this last value is unrelevant since left will always be true*/, lineStyle);//TopLeftRadius
        var trr:CGFloat = configRadius(fillet.topRight, offsetType.right || offsetType.top, lineStyle);/*TopRightRadius*/
        var blr:CGFloat = configRadius(fillet.bottomLeft, offsetType.left || offsetType.bottom, lineStyle);/*BottomLeftRadius*/
        var brr:CGFloat = configRadius(fillet.bottomRight, offsetType.right || offsetType.bottom, lineStyle);/*BottomRightRadius*/
        return new Fillet(tlr,trr,blr,brr);
    }
    /**
     * Returns a corner radius with correct radius according to the @param offsetType
     */
    class func configRadius(cornerRadius:CGFloat, offsetType:String, lineStyle:ILineStyle)->CGFloat{
        var multiplier:CGFloat;
        if(offsetType == OffsetType.OUTSIDE) multiplier = 1;
        else if(offsetType == OffsetType.INSIDE) multiplier = 1;
        else multiplier = 0;/*center*/
        if(cornerRadius > 0) cornerRadius += multiplier*(lineStyle.thickness/2);//divided by 4 because we are working with radius, which is half of a diameter of a circle
        return cornerRadius;
    }
}

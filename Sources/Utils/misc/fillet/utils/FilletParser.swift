import Foundation

class FilletParser {
    /**
     * Returns a fillet configured to PARAM: lineOffset and PARAM: lineStyle
     */
    static func config(_ fillet:Fillet, _ offsetType:OffsetType, _ lineStyle:LineStylable)->Fillet {/*Configure cornerRadius according to offsetType and lineStyle*/
        let tlr:CGFloat = configRadius(fillet.topLeft, offsetType.left/* || offsetType.top *//*<--this last value is unrelevant since left will always be true*/, lineStyle)/*TopLeftRadius*/
        let trr:CGFloat = configRadius(fillet.topRight, offsetType.right/* || offsetType.top*/, lineStyle)/*TopRightRadius*/
        let blr:CGFloat = configRadius(fillet.bottomLeft, offsetType.left/* || offsetType.bottom*/, lineStyle)/*BottomLeftRadius*/
        let brr:CGFloat = configRadius(fillet.bottomRight, offsetType.right/* || offsetType.bottom*/, lineStyle)/*BottomRightRadius*/
        return Fillet(tlr,trr,blr,brr)
    }
    /**
     * Returns a corner radius with correct radius according to the PARAM: offsetType
     */
    static func configRadius(_ cornerRadius:CGFloat, _ offsetType:String, _ lineStyle:LineStylable)->CGFloat{
        var cornerRadius:CGFloat = cornerRadius//swift 3, you can probably remove it
        var multiplier:CGFloat
        if(offsetType == OffsetType.outside){multiplier = 1}
        else if(offsetType == OffsetType.inside){multiplier = 1}//should this be -1?
        else {multiplier = 0}/*center*/
        if(cornerRadius > 0) { cornerRadius += multiplier * (lineStyle.thickness/2)}//divided by 4 because we are working with radius, which is half of a diameter of a circle
        return cornerRadius
    }
}

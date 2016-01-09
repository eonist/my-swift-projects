import Foundation

class SVGPathUtils {
    /**
     * Returns the boundingBox for the stroke in (the returned CGRect is in 0,0 space)
     */
    class func boundingBox(path:CGPath,_ style:SVGStyle)->CGRect{
        let strokeMiterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit)
        let strokeLineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let strokeLineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let strokeWidth:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth)
        let outlinePath = CGPathCreateCopyByStrokingPath(path, nil, strokeWidth, strokeLineCap, strokeLineJoin, strokeMiterLimit)
        let boundingBox:CGRect = CGPathGetPathBoundingBox(outlinePath)/*there is also CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        return boundingBox
    }
}

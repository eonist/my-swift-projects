import Foundation

class PathParser {
    /**
     * Returns the boundingBox for the stroke in (the returned CGRect is in 0,0 space)
     */
    class func boundingBox(path:CGPath,_ lineStyle:ILineStyle)->CGRect{
        let outlinePath = CGPathCreateCopyByStrokingPath(path, nil, lineStyle.thickness, lineStyle.lineCap, lineStyle.lineJoin, lineStyle.miterLimit)
        let boundingBox:CGRect = CGPathGetPathBoundingBox(outlinePath)/*there is also CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        return boundingBox
    }
}
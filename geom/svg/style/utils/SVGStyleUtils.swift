import Cocoa
/**
 * DISCUSSION:Probably move this into a more central place, but in the spirit of moving on!, Or not since its probably only related to how svg names these variables
 * NOTE: these methods provide a central place to convert values from the svg value scheme to the quartz value scheme
 */
class SVGStyleUtils {
    /**
     * TODO: try to find a method in swift that can extract enum values by providing a string
     */
    class func lineCap(lineCap:String?)->CGLineCap{
        let strokeLineCap = lineCap != nil && lineCap != "" ? lineCap : "butt"/*<-this was none, but it doesnt need to be since we wont extract this value from */
        if(strokeLineCap == "butt"){return CGLineCap.Butt}
        else if(strokeLineCap == "round"){return CGLineCap.Round}
        else if(strokeLineCap == "square"){return CGLineCap.Square}
        else{fatalError("this lineCap type is not supported")}
    }
    /**
     *
     */
    class func lineJoin(lineJoin:String?)->CGLineJoin{
        let strokeLineJoin = lineJoin != nil && lineJoin != "" ? lineJoin : "miter";
        if(strokeLineJoin == "miter"){return CGLineJoin.Miter}
        else if(strokeLineJoin == "round"){return CGLineJoin.Round}
        else if(strokeLineJoin == "bevel"){return CGLineJoin.Bevel}
        else{fatalError("this strokeLineJoin type is not supported")}
    }
    /**
     *
     */
    class func miterLimit(miterLimit:CGFloat)->CGFloat{
        return !miterLimit.isNaN ? miterLimit : 10/*<--was 1.414*/;
    }
    /**
     *
     */
    class func strokeWidth(strokeWidth:CGFloat)->CGFloat{
        return !(strokeWidth.isNaN) ? strokeWidth : 0
    }
    /**
     *
     */
    class func strokeColor(strokeColor:Double,_ strokeOpacity:CGFloat)->NSColor{
        /*color*/
        //Swift.print("style.stroke: " + "\(style.stroke)")
        let colorVal:Double = !(strokeColor.isNaN) ? strokeColor : Double(0x000000)
        //Swift.print("colorVal: " + "\(colorVal)")
        //Swift.print("strokeOpacity: " + "\(strokeOpacity)")
        let strokeOpacityVal:CGFloat = !(strokeOpacity.isNaN) ? strokeOpacity : 1;
        //Swift.print("strokeOpacityVal: " + "\(strokeOpacityVal)")
        let color:NSColor = NSColorParser.nsColor(UInt(colorVal), strokeOpacityVal)
        return color
    }
    /**
     * Returns the boundingBox for the stroke in (the returned CGRect is in 0,0 space)
     * @NOTE: if there is no strokeMiterLimit, then 10 is set as the default miter limit in LineStyle, this isnt always applied, and if its not there then we still need a value to work with, we could include it in the parsing of the svg, but then it would be exportable, which is undesired behaviour
     * TODO: if thre is no value the 0 can be used to calc the bounding box, this should be detected before the bounding box call though, as you dont need to calc the boundingbox if the stroke is 0
     */
    class func boundingBox(path:CGPath,_ style:SVGStyle)->CGRect{
        let strokeMiterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit != nil ? style.strokeMiterLimit! : 10)
        let strokeLineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let strokeLineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let strokeWidth:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth != nil ? style.strokeWidth!:0)/*this is new, we cant set a default value when parsing svg, if thre is no value the 0 can be used to calc the bounding box, this should be detected before the bounding box call though, as you dont need to calc the boundingbox if the stroke is 0*/
        let outlinePath = CGPathCreateCopyByStrokingPath(path, nil, strokeWidth, strokeLineCap, strokeLineJoin, strokeMiterLimit)
        let boundingBox:CGRect = CGPathGetPathBoundingBox(outlinePath)/*there is also CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        return boundingBox
    }
    /**
     * new
     */
    class func graphicStyle(svgGraphic:ISVGGraphic)->IGraphicStyle{
        let fillStyle:IFillStyle? = svgGraphic.style != nil ? SVGFillStyleUtils.fillStyle(svgGraphic.style!, svgGraphic.fillShape) : nil
        Swift.print("SVGStyleUtils.graphicStyle()  fillStyle: " + "\(fillStyle)")
        let lineStyle:ILineStyle? = svgGraphic.style != nil ? SVGLineStyleUtils.lineStyle(svgGraphic.style!, svgGraphic.lineShape) : nil
        return GraphicStyle(fillStyle,lineStyle)
    }
}
import Cocoa

class SVGLineStyleConverter{
    /**
     *
     */
    class func lineStyle(svgStyle:SVGStyle,_ shape:Shape)->ILineStyle?{
        var lineStyle:ILineStyle?
        if(svgStyle.stroke is Double) {
            lineStyle = colorLineStyle(svgStyle)
        }else if(svgStyle.stroke is SVGGradient){
            lineStyle = gradientLineStyle(svgStyle,shape)
        }else{/*clear*/
            //Swift.print("no stroke")
            //fatalError("not implemented yet " + "\(style!.stroke)")
        }
        return lineStyle
    }
    /**
     *
     */
    class func colorLineStyle(style:SVGStyle)->ILineStyle{
        var lineStyle:ILineStyle = LineStyle()
        lineStyle.thickness = SVGStyleUtils.strokeWidth(style.strokeWidth!)//let strokeWidth:CGFloat
        lineStyle.miterLimit = SVGStyleUtils.miterLimit(style.strokeMiterLimit!)
        lineStyle.lineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        lineStyle.lineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let strokeOpacity:CGFloat = style.fillOpacity != nil && !style.fillOpacity!.isNaN ? style.fillOpacity! : 1/*<-- this line is new, used to be done inline*/
        lineStyle.color = style.stroke != nil && style.stroke! is Double && !(style.stroke! as! Double).isNaN ? SVGStyleUtils.strokeColor(style.stroke! as! Double, strokeOpacity) : NSColor.clearColor()//if color is NaN or nil then set this to clear color
        return lineStyle
    }
    /**
     *
     */
    private class func gradientLineStyle(svgStyle:SVGStyle,_ shape:Shape)->IGradientLineStyle{
        //Swift.print("gradient")
        let lineStyle:ILineStyle = colorLineStyle(svgStyle)
        let graphicsGradient:IGraphicsGradient = SVGUtils.lineGraphicsGradient(shape, svgStyle)
        let gradient:IGradient = graphicsGradient.gradient()
        let gradientLineStyle = GradientLineStyle(gradient,lineStyle)
        return gradientLineStyle
    }
}
import Cocoa

class SVGStyleConverter {
    /**
     *
     */
    class func graphicStyle(svgStyle:SVGStyle,_ shape:Shape)->IGraphicStyle{
        
        let lineStyle:ILineStyle? = SVGLineStyleConverter.lineStyle(svgStyle, shape)
        let fillStyle:IFillStyle =
        //continue here: add support for Fill and LineStyle (remember to add Gradient support. and remember that you have all the code for this, just look at the actual drawing of the SVGGraphic. it converts to the format you need. )
        //this method should be made but the You have to merge IGradient and IGraphicsGradient somehow, you could create a third class named GraphicsStyle
        
        return GraphicStyle()
    }
}
private class SVGFillStyleConverter{
    /**
     *
     */
    class func fillColor(style:SVGStyle)->NSColor{
        //Swift.print("SVGGraphic.beginFill() color")
        let colorVal:Double = !(style.fill as! Double).isNaN ? style.fill as! Double : Double(0x000000)
        //Swift.print("colorVal: " + "\(colorVal)")
        let opacity:CGFloat = style.fillOpacity != nil && !style.fillOpacity!.isNaN ? style.fillOpacity! : 1
        let color:NSColor = NSColorParser.nsColor(UInt(colorVal), opacity)
        //Swift.print("color: " + "\(color)")
        return color
    }
}
private class SVGLineStyleConverter{
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
    private class func colorLineStyle(style:SVGStyle)->ILineStyle{
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
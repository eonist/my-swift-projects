import Cocoa

class SVGStyleConverter {
    /**
     *
     */
    class func graphicStyle(svgStyle:SVGStyle,_ shape:Shape)->IGraphicStyle{
        
        let lineStyle:ILineStyle? = SVGLineStyleUtils.lineStyle(svgStyle, shape)
        let fillStyle:IFillStyle? = SVGFillStyleUtils.fillStyle(svgStyle, shape)
        //continue here: add support for Fill and LineStyle (remember to add Gradient support. and remember that you have all the code for this, just look at the actual drawing of the SVGGraphic. it converts to the format you need. )
        //this method should be made but the You have to merge IGradient and IGraphicsGradient somehow, you could create a third class named GraphicsStyle
        
        return GraphicStyle()
    }
}
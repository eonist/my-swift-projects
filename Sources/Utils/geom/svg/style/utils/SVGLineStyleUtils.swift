import Cocoa

class SVGLineStyleUtils{
    static func lineStyle(_ svgStyle:SVGStyle,_ shape:Shape) -> LineStylable?{
        if svgStyle.stroke is Double {
            return colorLineStyle(svgStyle)
        }else if svgStyle.stroke is SVGGradient {
            return gradientLineStyle(svgStyle,shape)
        }else{/*clear*/
            //Swift.print("no stroke")
            //fatalError("not implemented yet " + "\(style!.stroke)")
            return nil
        }
    }
    static func colorLineStyle(_ style:SVGStyle) -> LineStylable{
        let thickness:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth!)
        let miterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit!)
        let lineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let lineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let strokeOpacity:CGFloat = style.fillOpacity != nil && !style.fillOpacity!.isNaN ? style.fillOpacity! : 1/*<-- this line is new, used to be done inline*/
        let color:NSColor = style.stroke != nil && style.stroke! is Double && !(style.stroke! as! Double).isNaN ? SVGStyleUtils.strokeColor(style.stroke! as! Double, strokeOpacity) : NSColor.clear//if color is NaN or nil then set this to clear color
        return LineStyle(thickness, color, lineCap, lineJoin, miterLimit)
    }
    private static func gradientLineStyle(_ svgStyle:SVGStyle,_ shape:Shape)->GradientLineStylable{
        let lineStyle:LineStylable = colorLineStyle(svgStyle)
        let graphicsGradient:GraphicsGradientKind = SVGLineStyleUtils.lineGraphicsGradient(shape, svgStyle)
        let gradient:GradientKind = graphicsGradient.gradient()
        let gradientLineStyle = GradientLineStyle(gradient,lineStyle)
        return gradientLineStyle
    }
    /**
     * TODO: when you scale the lineGradient, remember to consider that you dont scale the lineWidth and so the gradient that is applied may not cover as it should. This means that you cant simply scale the SVGGradient.transformation, instead you have to scale the gradient that is attached to the indeviduel SVGGraphic, and you have to take into consideration that the strokeThickness is now different than the new relative size. Even though its the same, the relative difference between the strokeThickness and the size of the shape is different. So you have to recalculate the gradient.transformation matrix a little bit. Probably by insetting it by some relative value
     */
    static func lineGraphicsGradient(_ shape:Shape,_ style:SVGStyle)->GraphicsGradientKind{
        guard let gradient:SVGGradientKind = style.stroke as? SVGGradientKind else {fatalError("shape.stroke is not SVGGradient")}
        let userSpaceOnUse:Bool = gradient.gradientUnits == "userSpaceOnUse"/*The gradientUnits attribute takes two familiar values, userSpaceOnUse and objectBoundingBox, which determine whether the gradient scales with the element that references it or not. It determines the scale of x1, y1, x2, y2.*/
        switch gradient{
            case let linearGradient as SVGLinearGradient:/*gradient is SVGRadialGradient */
                return Utils.linearGradient(shape, linearGradient, userSpaceOnUse)
            case let radialGradient as SVGRadialGradient:/*radial*/
                return Utils.radialGradient(shape, radialGradient, userSpaceOnUse)
            default:
                fatalError("gradient type not supported")
        }
    }
}

private class Utils{
    static func linearGradient(_ shape:Shape,_ gradient:SVGLinearGradient,_ userSpaceOnUse:Bool)->GraphicsGradientKind {
        var p1:CGPoint = /*userSpaceOnUse && !gradient.x1.isNaN && !gradient.y1.isNaN ? */CGPoint(gradient.x1,gradient.y1).copy()/* :nil*/
        var p2:CGPoint = /*userSpaceOnUse && !gradient.x2.isNaN && !gradient.y2.isNaN ? */CGPoint(gradient.x2,gradient.y2).copy()/* :nil*/
        if userSpaceOnUse {/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
            if gradient.gradientTransform != nil {
                p1 = p1.applying(gradient.gradientTransform!)
                p2 = p2.applying(gradient.gradientTransform!)
            }
            p1 -= shape.frame.origin
            p2 -= shape.frame.origin
        }else{/*objectBoundingBox*/
            //if(gradient.gradientTransform != nil){fatalError("transform here is not supported yet")}//you need to implement individual scaling of gradients first
            let boundingBox:CGRect = shape.frame.copy()//we could use the SVGStyleUtils.boundingBox which uses the Outline of the stroked line but this is already calculated and used in the frame, so we reuse that
            p1.x = boundingBox.width * (p1.x / 100)//this and the following lines of code can be compacted into 1 line
            p1.y = boundingBox.height * (p1.y / 100)
            p2.x = boundingBox.width * (p2.x / 100)
            p2.y = boundingBox.height * (p2.y / 100)
            //fatalError("relative values for gradient stroke isnt implemented yet, see similar code for gradient fill to impliment this")
        }
        return LinearGraphicsGradient(gradient.colors,gradient.offsets,nil/*gradient.gradientTransform*/,p1,p2)
    }
    static func radialGradient(_ shape:Shape,_ radialGradient:SVGRadialGradient,_ userSpaceOnUse:Bool)->GraphicsGradientKind {
        let startCenter:CGPoint = CGPoint(!radialGradient.fx.isNaN ? radialGradient.fx : radialGradient.cx,!radialGradient.fy.isNaN ? radialGradient.fy : radialGradient.cy)/*if fx or fy isnt found use cx and cy as replacments*/
        let endCenter:CGPoint = CGPoint(radialGradient.cx,radialGradient.cy)
        var transformation:CGAffineTransform = CGAffineTransform.identity
        if let gradientTransform = radialGradient.gradientTransform {
            transformation = gradientTransform.copy()
        }
        if userSpaceOnUse {/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
            transformation.concat(CGAffineTransform(translationX: -shape.frame.origin.x, y: -shape.frame.origin.y))//swift 3 upgrade
        }else{fatalError("relative values for gradient stroke isnt implemented yet, see similar code for gradient fill to impliment this")}
        let startRadius:CGFloat = 0
        let endRadius:CGFloat = radialGradient.r
        return RadialGraphicsGradient(radialGradient.colors,radialGradient.offsets,transformation/*nil*/,startCenter,endCenter,startRadius,endRadius)
    }
}

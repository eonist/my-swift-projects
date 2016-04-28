import Cocoa

class SVGLineStyleUtils{
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
        let graphicsGradient:IGraphicsGradient = SVGLineStyleUtils.lineGraphicsGradient(shape, svgStyle)
        let gradient:IGradient = graphicsGradient.gradient()
        let gradientLineStyle = GradientLineStyle(gradient,lineStyle)
        return gradientLineStyle
    }
    
    /**
     * TODO: when you scale the lineGradient, remember to consider that you dont scale the lineWidth and so the gradient that is applied may not cover as it should. This means that you cant simply scale the SVGGradient.transformation, instead you have to scale the gradient that is attached to the indeviduel SVGGraphic, and you have to take into consideration that the strokeThickness is now different than the new relative size. Even though its the same, the relative difference between the strokeThickness and the size of the shape is different. So you have to recalculate the gradient.transformation matrix a little bit. Probably by insetting it by some relative value
     */
    class func lineGraphicsGradient(shape:Shape,_ style:SVGStyle)->IGraphicsGradient{
        let gradient:SVGGradient = (style.stroke! as! SVGGradient)
        let userSpaceOnUse:Bool = gradient.gradientUnits == "userSpaceOnUse";//The gradientUnits attribute takes two familiar values, userSpaceOnUse and objectBoundingBox, which determine whether the gradient scales with the element that references it or not. It determines the scale of x1, y1, x2, y2.
        //let gradientType = gradient is SVGLinearGradient ? GradientType.Linear : GradientType.Radial;
        if(gradient is SVGLinearGradient){/*gradient is SVGRadialGradient */
            var p1:CGPoint = /*userSpaceOnUse && !gradient.x1.isNaN && !gradient.y1.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x1,(gradient as! SVGLinearGradient).y1).copy()/* :nil*/
            var p2:CGPoint = /*userSpaceOnUse && !gradient.x2.isNaN && !gradient.y2.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x2,(gradient as! SVGLinearGradient).y2).copy()/* :nil*/
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                if(gradient.gradientTransform != nil){
                    p1 = CGPointApplyAffineTransform(p1, gradient.gradientTransform!)
                    p2 = CGPointApplyAffineTransform(p2, gradient.gradientTransform!)
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
        }else{/*radial*/
            let radialGradient:SVGRadialGradient = gradient as! SVGRadialGradient
            let startCenter:CGPoint = CGPoint(!radialGradient.fx.isNaN ? radialGradient.fx : radialGradient.cx,!radialGradient.fy.isNaN ? radialGradient.fy : radialGradient.cy)/*if fx or fy isnt found use cx and cy as replacments*/
            let endCenter:CGPoint = CGPoint(radialGradient.cx,radialGradient.cy)
            var transformation:CGAffineTransform = CGAffineTransformIdentity
            if(radialGradient.gradientTransform != nil) {
                transformation = radialGradient.gradientTransform!.copy()
            }
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                transformation.concat(CGAffineTransformMakeTranslation(-shape.frame.origin.x, -shape.frame.origin.y))
            }else{fatalError("relative values for gradient stroke isnt implemented yet, see similar code for gradient fill to impliment this")}
            let startRadius:CGFloat = 0
            let endRadius:CGFloat = radialGradient.r
            return RadialGraphicsGradient(radialGradient.colors,radialGradient.offsets,transformation/*nil*/,startCenter,endCenter,startRadius,endRadius)
        }
    }
}
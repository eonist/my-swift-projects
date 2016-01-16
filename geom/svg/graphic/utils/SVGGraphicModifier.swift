import Cocoa

class SVGGraphicModifier {
    /**
     * Applies the @param strokeStyle to the @param graphics
     * @Note: If @param strokeStyle Does not have a variable, the default flash variable is applied
     * @NOTE: For example, a miter limit of 1.414 converts miters to bevels for theta less than 90 degrees, a limit of 4.0 converts them for theta less than approximately 29 degrees, and a limit of 10.0 converts them for theta less than approximately 11.5 degrees.
     * @NOTE: miterLength / stroke-width = 1 / sin ( theta / 2 ) The ratio of miter length (distance between the outer tip and the inner corner of the miter) to stroke-width is directly related to the angle (theta) between the segments in user space by the formula:
     * @NOTE: miterlimit The limit on the ratio of the miter length to the stroke-width. The value of <miterlimit> must be a <number> greater than or equal to 1.
     */
    class func applyStrokeStyle(graphics:Graphics, _ style:SVGStyle) {
        Swift.print("SVGGraphicModifier.applyStrokeStyle()")
        let strokeWidth:CGFloat = SVGStyleUtils.strokeWidth(style.strokeWidth)
        let strokeMiterLimit:CGFloat = SVGStyleUtils.miterLimit(style.strokeMiterLimit)
        let strokeLineCap:CGLineCap = SVGStyleUtils.lineCap(style.strokeLineCap)
        let strokeLineJoin:CGLineJoin = SVGStyleUtils.lineJoin(style.strokeLineJoin)
        let color:NSColor = style.stroke is Double && !(style.stroke as! Double).isNaN ? SVGStyleUtils.strokeColor(style.stroke as! Double, style.strokeOpacity) : NSColor.clearColor()//if color is NaN or nil then set this to clear color
        graphics.line(strokeWidth, color, strokeLineCap, strokeLineJoin, strokeMiterLimit)
    }
    /**
     *
     */
    class func applyGradientStrokeStyle(shape:Shape,_ style:SVGStyle){
        Swift.print("applyGradientStrokeStyle: " + "\(applyGradientStrokeStyle)")
        SVGGraphicModifier.applyStrokeStyle(shape.graphics,style)/*call the BaseGraphic to set the stroke-width, cap, joint etc*/
        let gradient:SVGGradient = (style.stroke! as! SVGGradient)
        //let gradientType = gradient is SVGLinearGradient ? GradientType.Linear : GradientType.Radial;
        if(gradient is SVGLinearGradient){
            let userSpaceOnUse:Bool = gradient.gradientUnits == "userSpaceOnUse";////The gradientUnits attribute takes two familiar values, userSpaceOnUse and objectBoundingBox, which determine whether the gradient scales with the element that references it or not. It determines the scale of x1, y1, x2, y2.
            var p1:CGPoint = /*userSpaceOnUse && !gradient.x1.isNaN && !gradient.y1.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x1,(gradient as! SVGLinearGradient).y1).copy()/* :nil*/
            var p2:CGPoint = /*userSpaceOnUse && !gradient.x2.isNaN && !gradient.y2.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x2,(gradient as! SVGLinearGradient).y2).copy()/* :nil*/
            if(gradient.gradientTransform != nil){
                p1 = CGPointApplyAffineTransform(p1, gradient.gradientTransform!)
                p2 = CGPointApplyAffineTransform(p2, gradient.gradientTransform!)
            }
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                p1 -= shape.frame.origin
                p2 -= shape.frame.origin
            }
            //let grad:IGradient = Gradient(gradient.colors,gradient.offsets,gradientType,0,nil,nil,nil,nil,p1,p2,!userSpaceOnUse/*,gradient.gradientTransform*/)
            fatalError("implment the bellow first")
            //shape.graphics.gradientLine(grad)
        }
    }
    /**
     * Begins a gradient fill on @param graphics with @param gradient
     * @NOTE: we use the Shape instance here because we need the frame offset to calculate the correct gradient p1 and p2 when using userspace
     * @NOTE: userspace uses real coordinates, nonuserspace uses relative coordinates 0 - 1 etc
     * @NOTE: userSpaceOnUse — x1, y1, x2, y2 represent coordinates in the current user coordinate system. In other words the values in the gradient are absolute values.
     * @NOTE: objectBoundingBox — x1, y1, x2, y2 represent coordinates in a system established by the bounding box of the element to which the gradient is applied. In other words the gradient scales with the element it’s applied to.
     * TODO: there is also: gradientTransform="rotate(90, 50, 30)" the origin of the rotation would be 50, 30
     * @NOTE: <radialGradient id="grad1" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
     * @NOTE: The cx, cy and r attributes define the outermost circle and the fx and fy define the innermost circle
     * @DISCUSSION: you cant directly apply the matrix transformation in the Graphics since the graphics class operates in 0,0 space and the matrix transformation that comes in operates it 0,0 space from the point of ciew of the viewbox (this probably isnt true when doing gradientUnits=" 'objectBoundingBox' only when doing: 'userSpaceOnUse' or )
     * TODO: unless you offset it first! try this
     */
    class func beginGradientFill(shape:Shape,_ gradient:SVGGradient) {
        //let graphics:Graphics = shape.graphics
        Swift.print("SVGGraphicModifier.beginGradientFill");
        //let gradientType = gradient is SVGLinearGradient ? GradientType.Linear : GradientType.Radial;
        let userSpaceOnUse:Bool = gradient.gradientUnits == "userSpaceOnUse";////The gradientUnits attribute takes two familiar values, userSpaceOnUse and objectBoundingBox, which determine whether the gradient scales with the element that references it or not. It determines the scale of x1, y1, x2, y2.
        //Swift.print("gradientType: " + gradientType);
        //var matrix:Matrix = Utils.matrix(graphic);
        
        //var spreadMethod:String = gradient.spreadMethod || SpreadMethod.PAD;
        //Swift.print("spreadMethod: " + spreadMethod);
        //var interpolationMethod:String = InterpolationMethod.RGB;/*InterpolationMethod.LINEAR_RGB*/
        //Swift.print("interpolationMethod: " + interpolationMethod);
        //let focalPointRatio:CGFloat = 0;/*from -1 to 1;*/
        
        //Swift.print("focalPointRatio: " + focalPointRatio);
        //Swift.print("gradient.colors: " + gradient.colors);
        //Swift.print("gradient.opacities: " + gradient.opacities);
        //Swift.print("gradient.offsets: " + gradient.offsets);
        
        if(gradient is SVGLinearGradient){
            //let gradient:SVGLinearGradient = gradient as! SVGLinearGradient
            
            //TODO: add support for relative values, see old code, you need to use the bounding box etc and test how relative values work in svg etc
            var p1:CGPoint = /*userSpaceOnUse && !gradient.x1.isNaN && !gradient.y1.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x1,(gradient as! SVGLinearGradient).y1).copy()/* :nil*/
            var p2:CGPoint = /*userSpaceOnUse && !gradient.x2.isNaN && !gradient.y2.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x2,(gradient as! SVGLinearGradient).y2).copy()/* :nil*/
            Swift.print("p1: " + "\(p1)")
            Swift.print("shape.frame.origin: " + "\(shape.frame.origin)")
            
            //TODO:  the problem is that you do the offset on values that are not yet sccaled. so either do scaling with matrix here or think of something els
            //you need to be able to derive variables from the svg graphic instance that reflect what should be in the export so base your setting of the gradient on this
            //maybe the graphic gradient is only absolute and you do matrix here instead?, since the offset will always be a problem etc, try this
            Swift.print("points: " + "\([p1,p2])")
            if(gradient.gradientTransform != nil){
                Swift.print("drawAxialGradient() gradient.transformation()")
                //i think you should do tje matrix in Graphics not here
                p1 = CGPointApplyAffineTransform(p1, gradient.gradientTransform!)
                p2 = CGPointApplyAffineTransform(p2, gradient.gradientTransform!)
            }
            Swift.print("points after: " + "\([p1,p2])")
            
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                p1 -= shape.frame.origin
                p2 -= shape.frame.origin
            }
            Swift.print("points after offset: " + "\([p1,p2])")
            let linearGraphicsGradient:IGraphicsGradient = LinearGraphicsGradient(gradient.colors,gradient.offsets,gradient.gradientTransform,p1,p2)
            //Gradient(gradient.colors,gradient.offsets,0,nil,nil,nil,nil,p1,p2,!userSpaceOnUse/*,gradient.gradientTransform*/)
            //fatalError("implment the bellow first")
            shape.graphics.gradientFill(linearGraphicsGradient)
        }else{/*gradient is SVGRadialGradient */
            Swift.print("drawRadialGradient()")
            let radialGradient:SVGRadialGradient = gradient as! SVGRadialGradient
            
            var startCenter:CGPoint = CGPoint(radialGradient.cx,radialGradient.cy)/*inner circle*/
            Swift.print("startCenter: " + "\(startCenter)")
            var endCenter:CGPoint = CGPoint(!radialGradient.fx.isNaN ? radialGradient.fx : radialGradient.cx,!radialGradient.fy.isNaN ? radialGradient.fy : radialGradient.cy)/*outer circle, if fx or fy isnt found use cx and cy as replacments*/
            Swift.print("endCenter: " + "\(endCenter)")
            if(radialGradient.gradientTransform != nil) {
                Swift.print("drawRadialGradient() gradient.transformation()")
                //matrix.concat(gradient.gradientTransform)
                startCenter = CGPointApplyAffineTransform(startCenter, gradient.gradientTransform!)
                endCenter = CGPointApplyAffineTransform(endCenter, gradient.gradientTransform!)
            }
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                Swift.print("userSpaceOnUse")
                startCenter -= shape.frame.origin
                endCenter -= shape.frame.origin
            }
            let startRadius:CGFloat = radialGradient.r/*inner circle*/
            Swift.print("startRadius: " + "\(startRadius)")
            let endRadius:CGFloat = 0/*outer circle*/
            //continue here: add support for absolute values first, then add relative values etc.
            let radialGraphicsGradient:IGraphicsGradient = RadialGraphicsGradient(radialGradient.colors,radialGradient.offsets,nil/*radialGradient.gradientTransform*/,startCenter,endCenter,startRadius,endRadius)
            shape.graphics.gradientFill(radialGraphicsGradient)
        }
    }
}
private class Utils{
    
}
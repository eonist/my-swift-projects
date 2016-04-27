import Cocoa
/*
 * XML utility methods (Beta)
 * @Note: This class has methods that conver SVG elements into XML
 */
class SVGUtils {
	/**
	 * Returns svg syntax in an XML instance derived from @param svg 
	 * @param svg (isntance of a custom SVG class that is easy to work with)
	 * @Note for the reverse function look into using the adobe native functionality namespaceDeclarations, namespace to also include the namespace
	 */
	class func xml(svg:SVG)->NSXMLElement {// :TODO: refactor to one or loop?
		let xml:NSXMLElement = SVGUtils.svg(svg)
		for (var i : Int = 0; i < svg.items.count; i++) {
			let svgElement:ISVGElement = svg.items[i]
			var child:NSXMLElement
            if(svgElement is SVGLine) {child = line(svgElement as! SVGLine)}
            else if(svgElement is SVGRect) {child = rect(svgElement as! SVGRect)}
            else if(svgElement is SVGPath) {child = path(svgElement as! SVGPath)}
            else if(svgElement is SVGGroup) {child = group(svgElement as! SVGGroup)}
            else {fatalError("type not supported: " + "\(svgElement)")}
            xml.appendChild(child)
		}
		return xml
	}
	/**
	 * Returns pathData from @param path (SVGPath instance)
	 */
	class func pathData(path:SVGPath)->String {
		var pathData:String = ""
		let commands:Array<String> = path.commands
		var parameters:Array<CGFloat> = path.parameters
		var index:Int = 0
		for command : String in commands {
			if(command.test("[m,M,l,L,t,T]")) {
				pathData += command + String(parameters[index]) + " " + String(parameters[index + 1]) + " "
				index += 2
			}else if(command.test("[h,H,v,V]")){
				pathData += command + String(parameters[index]) + " "
				index++
			}else if(command.test("[s,S,q,Q]")){
				pathData += command + String(parameters[index]) + " " + String(parameters[index+1]) + " " + String(parameters[index+2]) + " " + String(parameters[index+3]) + " "
				index++
			}else if(command.test("[c,C]")){
				pathData += command + String(parameters[index]) + " " + String(parameters[index+1]) + " " + String(parameters[index+2]) + " " + String(parameters[index+3]) + " " + String(parameters[index+4]) + " " + String(parameters[index+5]) + " ";
				index++
			}else if(command.test("[a,A]")){
				pathData += command + String(parameters[index]) + " " + String(parameters[index+1]) + " " + String(parameters[index+2]) + " " + String(parameters[index+3]) + " " + String(parameters[index+4]) + " " + String(parameters[index+5]) + " " + String(parameters[index+6]) + " ";
				index++
			}else if(command.test("[z,Z]")){
				pathData += command + " "
				index++
			}
		}
		pathData = pathData.replace("\\s*?$", "")/*Removes the ending whitespace, if it exists*/
		return pathData
	}
	/**
	 * Returns the root node for the SVG XML document
	 */
	class func svg(svg:SVG)->NSXMLElement {
		let xml:NSXMLElement = NSXMLElement("<?xml version=“1.0”?><svg></svg>")
		xml["xmlns"] = "http://www.w3.org/2000/svg"
		xml["x"] = String(svg.x)+"px"
		xml["y"] = String(svg.y)+"px"
		xml["width"] = String(svg.width)+"px"
		xml["height"] = String(svg.height)+"px"
		return xml;
	}
	/**
	 * Returns a svg line in SVG XML notation from @param line (SVGLine)
	 */
	class func line(line:SVGLine)->NSXMLElement {
		var xml:NSXMLElement = NSXMLElement("<line></line>")
		xml = id(xml,line);
		xml["x1"] = "\(line.x1)";
		xml["y1"] = "\(line.y1)";
		xml["x2"] = "\(line.x2)";
		xml["y2"] = "\(line.y2)";
		xml = style(xml,line);
		return xml;
	}
	/**
	 * Returns a svg rect in SVG XML notation from @param rect (SVGRect)
	 */
	 class func rect(rect:SVGRect)->NSXMLElement {//@Note: API<rect x="64" y="64" fill="none" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
		var xml:NSXMLElement = NSXMLElement("<rect></rect>")
		xml = id(xml,rect);
		xml["x"] = "\(rect.x)";
		xml["y"] = "\(rect.y)";
		xml["width"] = "\(rect.width)";
		xml["height"] = "\(rect.height)";
		xml = style(xml,rect);
		xml["stroke-miterlimit"] = "\(rect.style!.strokeMiterLimit)";
		return xml;
	 }
	 /**
	  * Returns an SVGPath instance in SVG XML notation from @param path (SVGPath)
	  */
	 class func path(path:SVGPath)->NSXMLElement {
         var xml:NSXMLElement = NSXMLElement("<path></path>")
		 xml = id(xml,path);
		 xml["d"] = SVGUtils.pathData(path);
		 xml = style(xml,path);
		 return xml;
	 }
	 /**
	  * Returns an XML instance with SVGGroup data derived from @param group
	  * @Note: this method is recursive
	  * // :TODO: remeber groups can have style applied inline cant they?
	  */
	 class func group(group:SVGGroup) -> NSXMLElement {
		 var xml:NSXMLElement = NSXMLElement("<g></g>")
		 xml = id(xml,group);
		 /*xml = style(xml,group); not supported yet*/
		 for (var i : Int = 0; i < group.items.count; i++) {
			 let svgGraphic:ISVGElement = group.items[i] as ISVGElement;
			 var child:NSXMLElement;
             if(svgGraphic is SVGLine) {child = line(svgGraphic as! SVGLine)}
             else if(svgGraphic is SVGRect) {child = rect(svgGraphic as! SVGRect)}
             else if(svgGraphic is SVGPath) {child = path(svgGraphic as! SVGPath)}
             else if(svgGraphic is SVGGroup) {child = SVGUtils.group(svgGraphic as! SVGGroup)}
             else{ fatalError("type not supported: " + "\(svgGraphic)")}
             xml.appendChild(child);
		 }
		 return xml;
	 }
	 /**
	  * Returns the id from a ISVG instance
	  * // :TODO: move to an internal class
	  */
	 class func id(xml:NSXMLElement,_ svg:ISVGElement)->NSXMLElement {
         if(svg.id != ""/*<-this was nil*/) {xml["id"] = svg.id}
		 return xml;
	 }
	 /**
	  * Returns an XML instance with style properties derived from @param xml
	  * // :TODO: move to an internal class
	  */
	 class func style(xml:NSXMLElement,_ graphic:SVGGraphic)->NSXMLElement {
        
         //this method is missing support for gradient (Get ques from the legacy SVGPropertyParser)
        
         xml["fill"] = graphic.style!.fill is Double && !((graphic.style!.fill as! Double).isNaN) ? "#"+HexParser.hexString(UInt(graphic.style!.fill as! Double)):"none"
		 xml["stroke"] = graphic.style!.stroke is Double && !(graphic.style!.stroke as! Double).isNaN ? "#"+HexParser.hexString(UInt(graphic.style!.stroke as! Double)):"none"
         if(graphic.style!.strokeWidth != nil && !graphic.style!.strokeWidth!.isNaN && graphic.style!.strokeWidth! != 1) {xml["stroke-width"] = "\(graphic.style!.strokeWidth!)"}/*if strokeWidth is 1 then you dont have to include it in the svg, this is considered a default value if stroke is avialbale*/
		 // :TODO: add support for fillOpacity,fillRule,strokeOpacity,strokeLineCap,strokeLineJoin,strokeMiterLimit, (Get ques from the old SVGPropertyParser)
		 return xml;
	 }
    /**
     *
     */
    class func style(svgStyle:SVGStyle,_ shape:Shape)->IGraphicStyle{
        
        var lineStyle:ILineStyle
        if(svgStyle.stroke is Double) {/*updates only if lineStyle of class LineStyle*/
            lineStyle = SVGUtils.lineStyle(svgStyle)
        }else if(svgStyle.stroke is SVGGradient){
            //Swift.print("gradient")
            let lineStyle:ILineStyle = SVGUtils.lineStyle(style)
            let graphicsGradient:IGraphicsGradient = SVGUtils.lineGraphicsGradient(shape, style)
            lineStyle = GradientLineStyle()
        }else{/*clear*/
            //Swift.print("no stroke")
            //fatalError("not implemented yet " + "\(style!.stroke)")
        }
        //continue here: add support for Fill and LineStyle (remember to add Gradient support. and remember that you have all the code for this, just look at the actual drawing of the SVGGraphic. it converts to the format you need. )
        //this method should be made but the You have to merge IGradient and IGraphicsGradient somehow, you could create a third class named GraphicsStyle
        
        return GraphicStyle()
    }
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
    /**
     *
     */
    class func lineStyle(style:SVGStyle)->ILineStyle{
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
    /**
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
    class func fillGraphicGradient(shape:Shape,_ gradient:SVGGradient)->IGraphicsGradient{
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
        /**
         * @NOTE: there is no need for transform in the LinearGraphicsGradient, all matrix transformation can be applied to the points
         * @NOTE: you need to be able to derive variables from the svg graphic instance that reflect what should be in the export so base your setting of the gradient on this
         */
        if(gradient is SVGLinearGradient){
            //let gradient:SVGLinearGradient = gradient as! SVGLinearGradient
            
            //TODO: add support for relative values, see old code, you need to use the bounding box etc and test how relative values work in svg etc
            var p1:CGPoint = /*userSpaceOnUse && !gradient.x1.isNaN && !gradient.y1.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x1,(gradient as! SVGLinearGradient).y1).copy()/* :nil*/
            var p2:CGPoint = /*userSpaceOnUse && !gradient.x2.isNaN && !gradient.y2.isNaN ? */CGPoint((gradient as! SVGLinearGradient).x2,(gradient as! SVGLinearGradient).y2).copy()/* :nil*/
            //Swift.print("p1: " + "\(p1)")
            //Swift.print("shape.frame.origin: " + "\(shape.frame.origin)")
            
            //TODO:  the problem is that you do the offset on values that are not yet sccaled. so either do scaling with matrix here or think of something els
            //maybe the graphic gradient is only absolute and you do matrix here instead?, since the offset will always be a problem etc, try this
            //Swift.print("points: " + "\([p1,p2])")
            
            //Swift.print("points after: " + "\([p1,p2])")
            
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                if(gradient.gradientTransform != nil){
                    //Swift.print("drawAxialGradient() gradient.transformation()")
                    //i think you should do tje matrix in Graphics not here
                    p1 = CGPointApplyAffineTransform(p1, gradient.gradientTransform!)
                    p2 = CGPointApplyAffineTransform(p2, gradient.gradientTransform!)
                }
                p1 -= shape.frame.origin
                p2 -= shape.frame.origin
            }else{/*objectBoundingBox*/
                if(gradient.gradientTransform != nil){fatalError("not supported yet")}
                let boundingBox:CGRect = CGPathGetBoundingBox(shape.path)
                p1.x = boundingBox.width * (p1.x / 100)//this code can be compacted into 1 line
                p1.y = boundingBox.height * (p1.y / 100)
                p2.x = boundingBox.width * (p2.x / 100)
                p2.y = boundingBox.height * (p2.y / 100)
                //Swift.print("p1: " + "\(p1)")
                //Swift.print("p2: " + "\(p2)")
            }
            //Swift.print("points after offset: " + "\([p1,p2])")
            let linearGraphicsGradient:IGraphicsGradient = LinearGraphicsGradient(gradient.colors,gradient.offsets,nil/*gradient.gradientTransform*/,p1,p2)
            //Gradient(gradient.colors,gradient.offsets,0,nil,nil,nil,nil,p1,p2,!userSpaceOnUse/*,gradient.gradientTransform*/)
            //fatalError("implment the bellow first")
            return linearGraphicsGradient
        }
            /**
            * @NOTE: it seems you can do the offseting in the matrix transformation
            * @TODO: lets try to scale radial gradient aswell
            */
        else{/*gradient is SVGRadialGradient */
            //Swift.print("drawRadialGradient()")
            let radialGradient:SVGRadialGradient = gradient as! SVGRadialGradient
            //Swift.print("radialGradient.gradientTransform: " + "\(radialGradient.gradientTransform)")
            let startRadius:CGFloat = 0
            var endRadius:CGFloat = radialGradient.r
            //Swift.print("endRadius: " + "\(endRadius)")
            
            var startCenter:CGPoint = CGPoint(!radialGradient.fx.isNaN ? radialGradient.fx : radialGradient.cx,!radialGradient.fy.isNaN ? radialGradient.fy : radialGradient.cy)/*if fx or fy isnt found use cx and cy as replacments*/
            //Swift.print("startCenter: " + "\(startCenter)")
            var endCenter:CGPoint = CGPoint(radialGradient.cx,radialGradient.cy)
            //Swift.print("endCenter: " + "\(endCenter)")
            
            var transformation:CGAffineTransform = CGAffineTransformIdentity
            
            if(userSpaceOnUse){/*we offset the p1,p2 to operate in the 0,0 space that the path is drawn in, inside frame*/
                //Swift.print("userSpaceOnUse")
                if(radialGradient.gradientTransform != nil) {
                    //Swift.print("drawRadialGradient() gradient.transformation()")
                    transformation = radialGradient.gradientTransform!.copy()
                    //Swift.print("transformation: " + "\(transformation)")
                    //matrix.concat(gradient.gradientTransform)
                    //startCenter = CGPointApplyAffineTransform(startCenter, gradient.gradientTransform!)
                    //endCenter = CGPointApplyAffineTransform(endCenter, gradient.gradientTransform!)
                }
                //startCenter -= shape.frame.origin
                //endCenter -= shape.frame.origin
                transformation.concat(CGAffineTransformMakeTranslation(-shape.frame.origin.x, -shape.frame.origin.y))
                //Swift.print("transformation: " + "\(transformation)")
            }else{/*objectBoundingBox*/
                //if(radialGradient.gradientTransform != nil) {fatalError("not supported yet")}
                //TODO: we dont use any transform yet, you need to sort out the scaling first see todolist in the basic svg support article
                let boundingBox:CGRect = CGPathGetBoundingBox(shape.path)//TODO: reuse frame as the bounding box
                startCenter.x = boundingBox.width * (startCenter.x / 100)//this code can be compacted into 1 line
                startCenter.y = boundingBox.height * (startCenter.y / 100)
                endCenter.x = boundingBox.width * (endCenter.x / 100)
                endCenter.y = boundingBox.height * (endCenter.y / 100)
                
                let minAxis:CGFloat = min(boundingBox.width,boundingBox.height)/*We need the smallest axis length, either width or height*/
                let minRadius:CGFloat = minAxis/2/*Radius is half the axis length*/
                endRadius = minRadius * (endRadius/100*2)//needs to be half of minwidth of boundingbox, multiply by 2 since we are using radius not diameter, this can be optimized
                //Swift.print("endRadius: " + "\(endRadius)")
                //Swift.print("startCenter: " + "\(startCenter)")
                //Swift.print("endCenter: " + "\(endCenter)")
            }
            return RadialGraphicsGradient(radialGradient.colors,radialGradient.offsets,transformation/*nil*/,startCenter,endCenter,startRadius,endRadius)
            
        }
    }
}
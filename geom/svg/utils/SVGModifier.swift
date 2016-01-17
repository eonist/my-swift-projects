import Foundation

class SVGModifier {
	/**
	 * Offsets each item in a svg by @param offset (Point)
	 * // :TODO: add support for other SVG elements as well, use switch method instead of if
	 */
	class func offsetItems(svg:SVG, _ offset:CGPoint) {
		for (var i : Int = 0; i < svg.items.count; i++) {
			let svgGraphic:SVGGraphic = svg.items[i] as! SVGGraphic;
			if(svgGraphic is SVGLine){
				(svgGraphic as! SVGLine).x1 += offset.x;
				(svgGraphic as! SVGLine).x2 += offset.x;
				(svgGraphic as! SVGLine).y1 += offset.y;
				(svgGraphic as! SVGLine).y2 += offset.y;
			}else if(svgGraphic is SVGRect){
				(svgGraphic as! SVGRect).x += offset.x;
				(svgGraphic as! SVGRect).y += offset.y;
			}
		}
	}
	/**
	 * Scales SVG elements at @param pivot to @param scale (0-1) 
	 * @param scalePoint (0 - 1)
	 * @Note this method is recursive
	 * @example SVGModifier.scale(svg, new Point(0,0), new Point(0.5,0.5));
     * @NOTE: The stroke thickness isnt scaled, is this correct or?
     * @NOTE: When you scale an Element and the Element has a SVGGradient asits fill or line, then the original SVGGradient isnt scaled per se, so if you want the gradient to follow the shape then either also scale the gradient (make sure the gradient isnt attached to other shapes) or make sure the gradient uses non-absolute values, like objectBounidngbox as the gradientUnits and % values for the x1,y2,x2,y2 values etc, one could also imagine a system were you scale only the gradient attached to the Element, that would require some more code though and is not needed for the imidiate usecase
	 */
	class func scale(element:ISVGElement,_ pivot:CGPoint, _ scale:CGPoint) {
		Swift.print("SVGModifier.scale() element: " + "\(element)")
        switch(true){
			case element is SVGPolyLine:(element as! SVGPolyLine).points = PointModifier.scalePoints((element as! SVGPolyLine).points, pivot, scale);/*SVGPolyLine,SVGPolygon*/break;
            case element is SVGPolygon:(element as! SVGPolygon).points = PointModifier.scalePoints((element as! SVGPolygon).points, pivot, scale);break;
			case element is SVGRect:SVGRectModifier.scale(element as! SVGRect, pivot, scale);break;
			case element is SVGLine:SVGLineModifier.scale(element as! SVGLine,pivot,scale);break;
			case element is SVGPath:
                SVGPathModifier.scale(&(element as! SVGPath).parameters, (element as! SVGPath).commands , pivot, scale);break;
			case element is SVGCircle:SVGCircleModifier.scale(element as! SVGCircle, pivot, scale);break;
			case element is SVGEllipse:SVGEllipseModifier.scale(element as! SVGEllipse, pivot, scale);break;
			case element is SVGContainer:SVGContainerModifier.scale(element as! SVGContainer,pivot,scale);break;
			case element is SVGGradient:SVGGradientModifier.scale(element as! SVGGradient, pivot, scale);break;/*The individual style.gradient.transform instances are scaled so why do we need to scale this? It may be usefull for export purpouses*/
            default: break;
		}
        if(element is ISVGGraphic) {update(element as! ISVGGraphic)}//<---this may need to not use a protocol for casting
	}
    
	/**
	 * Styles an @param element with @param style
	 * // :TODO: rename to stylize?
	 * @Note this method is recursive
	 */
	class func style(element:ISVGElement,_ style:SVGStyle) {
        if(element is SVGView) {(element as! SVGView).style = style}
        if(element is SVGGraphic) {update(element as! SVGGraphic)}
        if(element is SVGContainer) {
            for (var i : Int = 0; i < (element as! SVGContainer).items.count; i++){
                if((element as! SVGContainer).items[i] is ISVGView) {SVGModifier.style((element as! SVGContainer).items[i], style)}
            }
        }
	}
	/**
	 * updates an SVGGraphic
	 */
	class func update(graphic:ISVGGraphic) {
        Swift.print("update")
        //WARNING: this method is incomplete, needs correct order of calls etc
        graphic.draw();/*<--draws the path with the new params*/
        		
		//graphic.endFill();
        graphic.fillShape.setNeedsDisplay()/*there needs to be an update to the beginFill and applyLineStyll since gradient matrices may have changed etc, but the call must be a request not a direct call since the context isnt ready yet*/
        graphic.lineShape.setNeedsDisplay()
	}
    /**
     * Describes all svg elements in a SVG instance, is not recursive yet
     * // :TODO: impliment SVGGroup
     * IMPORTANT: I have no idea, but this method only works if its inside the class (Spent 3-4 hours debugging it, could be the xcode app acting out, nothing changed after reboot either)
     */

    class func describeAll(svg:SVG){
        Swift.print("SVGParser.describeAll()")
        for svgElement : ISVGElement in svg.items {
            if(svgElement is SVGPath){
                Swift.print((svgElement as! SVGPath).commands);
                Swift.print((svgElement as! SVGPath).parameters);
            }else if(svgElement is SVGPolygon){
                Swift.print("(element as! SVGPolygon).points: " + "\((svgElement as! SVGPolygon).points)")
                Swift.print("SVGPolygon: " + "\((svgElement as! SVGPolygon).points)");
            }else if(svgElement is SVGPolyLine){
                Swift.print((svgElement as! SVGPolyLine).points);
            }else if(svgElement is SVGRect){
                Swift.print("SVGRect: " + "\(svgElement)");
                Swift.print("width: " + " + \((svgElement as! SVGRect).width)")
                Swift.print("height: " + "\((svgElement as! SVGRect).height)")
                Swift.print("x: " + "\((svgElement as! SVGRect).x)")
                Swift.print("y: " + "\((svgElement as! SVGRect).y)")
            }else{
                fatalError("\(svgElement)" + " is not supported yet")
            }
        }
    }
}
class SVGCircleModifier {
    /**
     * Scales the SVGCircle instance from @param pivot to a specific @param scale scalar value (0-1)
     */
    class func scale(circle:SVGCircle,_ pivot:CGPoint,_ scale:CGPoint) {
        Swift.print("SVGCircleModifier.circle() circle: " + "\(circle)")
        //Swift.print("circle.r: " + "\(circle.r)")
        let circleCenter:CGPoint = PointModifier.scale(circle.center, pivot, scale);
        let circleRadius:CGFloat = circle.r * scale.x;
        circle.center = circleCenter;
        circle.r = circleRadius;
    }
}
private class SVGRectModifier {
    /**
     * Scales the SVGRect instance from @param pivot to a specific @param scale scalar value (0-1)
     * // :TODO: impliment support for scaling the rx and ry values in the SVGRect instance, you have code for this Think fillet classes
     * IMPORTANT: this method seems to only work if its in this file (spend 3-4 hours trying to debug it, i think its either xcode or the strange array system that svg uses), you could figure this out if you mimicked the svg system and only used basic classes. Like a dummy test. Then compare unitill you got it working. For now though, we need to move on
     */
    class func scale(rect:SVGRect,_ pivot:CGPoint,_ scale:CGPoint) {
        let position:CGPoint = PointModifier.scale(rect.position, pivot, scale);
        let size:CGSize = CGSize(rect.width * scale.x, rect.height * scale.y);//TODO:use CGRect scale method instead
        rect.x = position.x;
        rect.y = position.y;
        rect.width = size.width;
        rect.height = size.height;
    }
}
import Foundation
/*
* // :TODO: impliment graphics.drawGraphicsData
*/
class SVGPathModifier {
    /**
     * Scales @param path at @param pivot with @param scalePoint
     * @Note: I guess the reason to use scalePoint and not a scalar value (0-1) is because scalePoint is more precise
     * // :TODO: discuss why you use scalePoint and not scalar value in more detail.
     * // :TODO: create a method in NumberModifer named scale that takes value:Number,pivot:Number,scale:Number
     */
    class func scale(inout parameters:Array<CGFloat>,/*path:SVGPath*/ _ commands:Array<String>,_ pivot:CGPoint,_ scalePoint:CGPoint) {
        var i:Int = 0;/*parameterIndex*/
        var commands:Array<String> = commands;
        var params:Array<CGFloat> = parameters;
        var p:CGPoint;
        var c1:CGPoint;
        var c2:CGPoint;
        var a2:CGPoint;
        for (var e : Int = 0; e < commands.count; e++) {
            let command:String = commands[e];
            switch(command.lowercaseString){
            case SVGPathCommand.l,SVGPathCommand.m://<-this may need testing since it may be || instead of ,
                p = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                parameters[i] = p.x;
                parameters[i+1] = p.y;
                i += 2;
                break;
            case SVGPathCommand.h:
                p = PointModifier.scale(CGPoint(params[i],0), pivot, scalePoint);
                parameters[i] = p.x;
                i++;
                break;
            case SVGPathCommand.v:
                p = PointModifier.scale(CGPoint(0,params[i]), pivot, scalePoint);
                parameters[i] = p.y;
                i++;
                break;
            case SVGPathCommand.c:
                c1 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                c2 = PointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint);
                a2 = PointModifier.scale(CGPoint(params[i+4],params[i+5]), pivot, scalePoint);
                //						trace(e+" scale.c c1: "+c1 + " c2:"+c2+" a2:" + a2);
                parameters[i] = c1.x;
                parameters[i+1] = c1.y;
                parameters[i+2] = c2.x;
                parameters[i+3] = c2.y;
                parameters[i+4] = a2.x;
                parameters[i+5] = a2.y;
                i+=6;
                break;
            case SVGPathCommand.s:
                c2 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                a2 = PointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint);
                parameters[i] = c2.x;
                parameters[i+1] = c2.y;
                parameters[i+2] = a2.x;
                parameters[i+3] = a2.y;
                i+=4;
                break;
            case SVGPathCommand.q:
                c1 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                a2 = PointModifier.scale(CGPoint(params[i+2],params[i+3]), pivot, scalePoint);
                parameters[i] = c1.x;
                parameters[i+1] = c1.y;
                parameters[i+2] = a2.x;
                parameters[i+3] = a2.y;
                i+=4;
                break;
            case SVGPathCommand.t:
                a2 = PointModifier.scale(CGPoint(params[i],params[i+1]), pivot, scalePoint);
                parameters[i] = a2.x;
                parameters[i+1] = a2.y;
                i+=2;
                break;
            case SVGPathCommand.z: 
                /*do nothing*/
                break;
            default:break;
            }
        }
    }
}


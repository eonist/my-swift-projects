import Foundation

class DisplayArcUtils {
    /**
     * Draws an Arc in the path (startAngle and endAngle)
     * TODO: To support rotation you need to work that in to the transformation probaby
     * NOTE: The CGPathAddArc method doesnt seem to support drawing from negative area to positive area. The CGPathAddRelativeArc method supports this
     */
    static func arcTo(_ path:CGMutablePath,_ arc:IArc) {
        let angleArc:AngleArc = DisplayArcUtils.arc(arc.start, CGPoint(arc.xRadii,arc.yRadii),arc.rotation,arc.largeArcFlag,arc.sweepFlag,arc.end,arc.center!)
        /*
        Swift.print("describe: angleArc")
        angleArc.describe()
        Swift.print("")
        */
        //DisplayArcUtils.angleArcTo(graphics,arcObj["xRadii"],arcObj["yRadii"],arcObj["start"],arcObj["end"],arcObj["center"]["x"],arcObj["center"]["y"],arc.rotation)
        var transform:CGAffineTransform = angleArc.transform/*this must be its own variable to get the unsafePointer arg in the bellow call to work*/
        transform.rotateAroundPoint(angleArc.rotation, angleArc.center)
        path.addRelativeArc(angleArc.center, angleArc.xRadii, angleArc.start, angleArc.delta, transform/*nil*/)//swift 3 update
    }
    /**
     * NOTE: (rx, ry, x-axis-rotation, large-arc-flag, sweep-flag, x, y)
     */
    static func arcTo(_ startX:CGFloat,_ startY:CGFloat,_ centerX:CGFloat,_ centerY:CGFloat,_ xAxisRot:CGFloat,_ largeArcFlag:Bool,_ sweepFlag:Bool, _ endX:CGFloat, _ endY:CGFloat){
        //You need to derive the xRadii and yRadii from start and end points (there is a formula that can create an ellipse from 2 points and a center and a rotation etc)
        //then you can convert to an angled arc
        //then you use the angledArc to draw the arc with the native CGPath arc method that supports this
    }
    /**
     * Draws an arc on PARAM graphics
     * NOTE: SEGMENT_COUNT:uint = 32//32;//a fixed Arc interpolation number (Higher number means higher arc resolution, Lower means higher performance)
     * NOTE: var points:Vector.<CurvePoint> = ArcParser.curvePoints(this, SEGMENT_COUNT);Computes and returns curve points needed to draw the curve
     */
     /*
     static func angleArcTo(graphics:Any, _ xRadii:CGFloat, _ yRadii:CGFloat, _ start:CGFloat,_ end:CGFloat,_ centerX:CGFloat,_ centerY:CGFloat,_ rotation:CGFloat) {
        var points:Array<CurvePoint> = Utils.curvePoints(new Point(centerX,centerY),start,end,new Point(xRadii,yRadii),rotation,16);//Computes and returns curve points needed to draw the curve
        if (points.length > 0) graphics["moveTo"](points[0].anchor1.x, points[0].anchor1.y);/*sets the initial point to be drawn from*/// :TODO: is this correct? move to ?? this efectivly creates a gap no?
        for(var i:uint = 0; i<points.length; ++i) graphics["curveTo"](points[i].control.x, points[i].control.y, points[i].anchor2.x, points[i].anchor2.y);/*Curves to the spessific anchor and control points*/
     }
     */
     /**
      * Returns an object containing the start angle, end angle and center point
      * PARAM: r radii in the xAxis,yAxis (half of the ellipse xAxis,yAxis)
      * PARAM: rot rotation of the ellipse (in radians)
      * PARAM: largeArcFlag if the the angle span between PARAM: start and PARAM: end is more than 180 degrees then this is false else its true
      * PARAM: sweepFlag cw vs ccw
      * PARAM: start is the start point of the arc
      * PARAM: end is the end point of the arc
      * NOTE: to decipher this code you can add many debugcrosshairs
      */
    static func arc(_ start:CGPoint, _ r:CGPoint,_ rot:CGFloat,_ largeArcFlag:Bool,_ sweepFlag:Bool,_ end:CGPoint,_ center:CGPoint) -> AngleArc {// :TODO: move to AdvanceArc5Parser?!?
        var r = r
        if(r.y == 0){/*if the arc is flat*/
            //Swift.print("Angle.angle(center, start): " + Angle.angle(center, start))
            //Swift.print("r.x: " + r.x)
            //Swift.print("center: " + center)
            //Swift.print("start: " + start)
            let sY:CGFloat = TrigParser.y(CGPoint.distance(center, start), r.x, CGPoint())
            //Swift.print("sY: " + sY)
            let s:CGPoint = CGPoint(start.x,start.y-sY)
            //Swift.print("Angle.normalize2(Angle.angle(center, s)-rot): " + Angle.normalize2(Angle.angle(center, s)-rot))
            let sAngle:CGFloat = BasicEllipseMath.advanceEllipticalAngle(r.x*r.x, r.x*r.x, TrigParser.normalize2(Trig.angle(center, s)-rot))
            //Swift.print("sAngle: " + sAngle)
            //Swift.print("Angle.angle(center, end): " + Angle.angle(center, end))
            let leveledEnd:CGPoint = rot == 0 ? end : CGPointModifier.rot(end, center, rot)
            let projectedEnd:CGPoint = CGPoint(leveledEnd.x,TrigParser.y(leveledEnd.x, r.x, center))
            var circularEndAngle:CGFloat = Trig.normalize2(Trig.angle(center,projectedEnd)) + rot
            circularEndAngle *= largeArcFlag ? 1 : -1
            //Swift.print("circularEndAngle: " + circularEndAngle)
            //  return ["start":sAngle/*Angle.flip(startAngle, multiplier)*/,"end":circularEndAngle/*Angle.flip(endAngle, multiplier)*/,"center":center,"xRadii":r.x,"yRadii":r.y]
            return AngleArc(sAngle/*Angle.flip(startAngle, multiplier)*/,circularEndAngle/*Angle.flip(endAngle, multiplier)*/,r.x,r.y,center)
        }
        let cosRot:CGFloat = cos(rot)/*store cos/sin rotation*/
        let sinRot:CGFloat = sin(rot)
        var m:CGPoint = CGPoint((end.x-start.x)/2,(end.y-start.y)/2);/*find the midPoint between start and end points , offset from the end point (m = midPoint)*///PointParser.divide(end.subtract(start), new Point(2,2));
        //Swift.print("m: " + m);
        m = CGPoint(cosRot * m.x + sinRot * m.y, -sinRot * m.x + cosRot * m.y)/*apply the rotation to the midPoint*/// :TODO: is the same as rotate around external point?
        //Swift.print("m: " + m);
        r = CGPoint(abs(r.x),abs(r.y))/*Ensure radii are large enough ,Forces the r.x and r.y to be positive - SVG implimentation notes: F.6.6 Correction of out-of-range radii*/
        //Swift.print("r: " + r);
        var r2:CGPoint = CGPoint(r.x*r.x,r.y*r.y)/*r2= r^2*/
        //Swift.print("r2: " + r2);
        let m2:CGPoint = CGPoint(m.x*m.x,m.y*m.y)/*m2 = m^2*/
        //Swift.print("m2: " + m2);
        let radiiCheck:CGFloat = m2.x/r2.x + m2.y/r2.y;/*check that radii are large enough - SVG implimentation notes: F.6.6 Correction of out-of-range radii*/
        //Swift.print("radiiCheck: " + radiiCheck);
        if (radiiCheck > 1) {
            r = CGPoint(sqrt(radiiCheck)*r.x,sqrt(radiiCheck)*r.y)/*If the result of the above equation is less than or equal to 1, then no further change need be made to rx and ry. If the result of the above equation is greater than 1, then make the replacements*/
            r2 = CGPoint(r.x*r.x,r.y*r.y)
        }
        let sign:CGFloat = largeArcFlag != sweepFlag ? -1 : 1/*Compute (cx1, cy1)*/
        //Swift.print("sign: " + sign);
        var sq:CGFloat = ((r2.x*r2.y)-(r2.x*m2.y)-(r2.y*m2.x)) / ((r2.x*m2.y)+(r2.y*m2.x))
        //Swift.print("sq: " + sq);
        sq = (sq < 0) ? 0 : sq
        //Swift.print("sq: " + sq);
        let coef:CGFloat = (sign * sqrt(sq))
        //Swift.print("coef: " + coef);
        let c1:CGPoint = CGPoint(coef * ((r.x * m.y) / r.y), coef * -((r.y * m.x) / r.x))/*this value creates the arc position if you add the mid point between start and end point*/
        //Swift.print("c1: " + c1);
        let pc:CGPoint = CGPoint.interpolate(start, end, 0.5)/*find the midPoint between start point and end point (pc = pointCenter)*/
        //Swift.print("pc: " + pc);
        let c:CGPoint = CGPoint(pc.x + (cosRot * c1.x - sinRot * c1.y), pc.y + (sinRot * c1.x + cosRot * c1.y))/*c = Center find the center of the arc*/
        //Swift.print("c: " + c);
        let multiplier:CGPoint = CGPoint(sweepFlag ? 1:-1,1)/*find the correct angle and axis values*/
        r = CGPoint(r.x*multiplier.x,r.y*multiplier.y)
        let axis:CGPoint = CGPoint(r.x*2,r.y*2)
        //Swift.print("axis.x: " + axis.x);
        //Swift.print("axis.y: " + axis.y);
        //Swift.print("Angle.normalize2(Angle.angle(c, start): " + Angle.normalize2(Angle.angle(c, start)));
        let startAngle:CGFloat = BasicEllipseMath.advanceEllipticalAngle(axis.x, axis.y, Trig.normalize(Trig.angle(c, start)-rot))/*<- new code (used to use normalize2)*/
        let endAngle:CGFloat = BasicEllipseMath.advanceEllipticalAngle(axis.x, axis.y, Trig.normalize(Trig.angle(c, end)-rot))/*<- new code (used to use normalize2)*/
        //return ["start":,"end":,"center":,"xRadii":,"yRadii":r.y]//return Arc4(r.x, r.y, Angle.flip(startAngle, multiplier), Angle.flip(endAngle, multiplier), c,); // :TODO: why do we have to flip the angles?
        r = CGPoint(abs(r.x),abs(r.y))/*<--BETA: This is new, we need to clamp the radii values to be positive, since CGPath can only use posetive radii values*/
        return AngleArc(/*startAngle*/Trig.flip(startAngle, multiplier),/*endAngle*/Trig.flip(endAngle, multiplier),r.x,r.y,c,rot)
    }
}

//the problem is here: we are not flipping the angles, check legacy code if its being done there, also norm1 instead of norm2 on some of the variables is this the same in legacy?

private class BasicEllipseMath {
    /**
     * Returns a eliptical angle ( which is the angle of the elliptical arc prior to the stretch and rotate operations.)
     * PARAM: angle: an circular angle
     * IMPORTANT: atan2 is when measured counterclockwise from a circle's x axis
     * NOTE: can also use atan(y/x); (atan returns funky rotatioin values, i guess clockwise from x axis, test this though)
     * NOTE: this is the same but just as a refrence: Angle.angle(new Point(0,0), new Point(Math.cos(angle) / xAxis,Math.sin(angle) / yAxis))
     */
    static func ellipticalAngle(_ xAxis:CGFloat, _ yAxis:CGFloat, _ angle:CGFloat)->CGFloat {// :TODO: rename to : something like counterClockwiseEllipticalAngle?
        let x:CGFloat = cos(angle) / xAxis
        let y:CGFloat = sin(angle) / yAxis
        return atan2(y,x)
    }
    /**
     * NOTE: use this if you only know the circular angle of a point on a rotated ellipse
     * // :TODO: the angle should be the last argument
     */
    static func advanceEllipticalAngle(_ xAxis:CGFloat, _ yAxis:CGFloat, _ angle:CGFloat,_ rotation:CGFloat = 0) -> CGFloat {
        return ellipticalAngle(xAxis,yAxis,angle-rotation)
    }
}

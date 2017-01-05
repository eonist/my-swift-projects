import Foundation

/*
Radial gradient:

Fill the current clipping region of `context' with a radial gradient
between two circles defined by the center point and radius of each
circle. The location 0 of `gradient' corresponds to a circle centered at
`startCenter' with radius `startRadius'; the location 1 of `gradient'
corresponds to a circle centered at `endCenter' with radius `endRadius';
colors are linearly interpolated between these two circles based on the
values of the gradient's locations. The option flags control whether the
gradient is drawn before the start circle or after the end circle.
*/

class RadialGradientUtils{
    /**
     * NOTE: needs better explinations
     * NOTE: in order to get a squashed radial gradient we need to use the transform.
     * NOTE: the matrix that is provided needs to be applied inorder to keep the init ratio (this matrix should be calulated when from the graphic point of view not here)
     * NOTE: a custom matrix is the only way to squeez the gradient.
     */
    static func radialGradient(boundingBox:CGRect,_ gradient:RadialGradient)->(startCenter:CGPoint,endCenter:CGPoint,startRadius:CGFloat,endRadius:CGFloat,transform:CGAffineTransform){
        let endCenter = CGPoint(boundingBox.width/2 ,boundingBox.height/2)/*Find the center of the boundingbox, the pivot*/
        let minAxis:CGFloat = min(boundingBox.width,boundingBox.height)/*We need the smallest axis length, either width or height*/
        let minRadius:CGFloat = minAxis/2/*Radius is half the axis length*/
        let endFocusPoint:CGPoint = endCenter.polarPoint(minRadius, 0)/*Since we do the scaling, rotation and offseting on the context we dont have to worry about rotating the geometry etc*/
        let focalRatio:CGFloat = gradient.startCenter!.y/*from -1 to 1*/
        let startCenter:CGPoint = endCenter.interpolate(endFocusPoint, focalRatio)
        let startRadius:CGFloat = 0.0/*This is less important when your using a focal point system, can be used when you implement the 2 point gradient system*/
        let endRadius:CGFloat = minRadius/*The radius of the gradient*/
        //Swift.print("RadialGradientUtils gradient.endRadius: " + "\(gradient.endRadius)")
        //Swift.print("RadialGradientUtils gradient.endRadius!.width: " + "\(gradient.endRadius!.width)")
        //Swift.print("RadialGradientUtils gradient.endRadius!.height: " + "\(gradient.endRadius!.height)")
        let scale:CGPoint = CGPoint(gradient.endRadius!.width,gradient.endRadius!.height)
        //Swift.print("scale: " + "\(scale)")
        let offset:CGPoint = CGPoint(-minRadius + (minAxis*gradient.endCenter!.x),-minRadius + (minAxis*gradient.endCenter!.y))
        //Swift.print("offset: " + "\(offset)")
        let transform:CGAffineTransform = CGAffineTransform.transformAroundPoint(CGAffineTransformIdentity, scale, gradient.rotation, offset, endCenter)//CGAffineTransformMakeTranslation(x, y);
        //Swift.print("transform: " + "\(transform)")
        //Swift.print("startCenter: " + "\(startCenter)")
        //Swift.print("endCenter: " + "\(endCenter)")
        //Swift.print("endRadius: " + "\(endRadius)")
        //Swift.print("startRadius: " + "\(startRadius)")
        return (startCenter,endCenter,startRadius,endRadius,transform)
    }
}
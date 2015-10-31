import Cocoa
class CGContextModifier{
    /**
    * Note: the float, cgfloat stuff can be cleaned up to only use cg float if ever used.
    */
   class func addStar(context:CGContextRef,_ center:CGPoint, _ radius:Float, _ angle:Float){
        let x:Float  = radius * sinf(angle * Float(M_PI) / 5.0) + Float(center.x)
    
        let y:Float  = radius * cosf(angle * Float(M_PI) / 5.0) + Float(center.y)
    
		CGContextMoveToPoint(context, CGFloat(x), CGFloat(y))
		for(var i:Int = 1; i < 5; ++i){
			let x:Float = radius * sinf((Float(i) * 4.0 * Float(M_PI) + angle) / 5.0) + Float(center.x);
			let y:Float = radius * cosf((Float(i) * 4.0 * Float(M_PI) + angle) / 5.0) + Float(center.y);
			CGContextAddLineToPoint(context, CGFloat(x), CGFloat(y))
		}
		CGContextClosePath(context)// And close the subpath.
   }
}
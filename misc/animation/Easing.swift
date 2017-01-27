import Cocoa
/**
 * t: time (current frame) this can also be actual time
 * b: begin (the value it is at the begining)
 * c: change (end value - begining value) sort of the amount to change, this can also be described as the difference between two values
 * d: duration (total frames in anim) this can also be actual time
 * TODO://Elastic, Circular, Back, bounce, Quibic +++
 * NOTE: robertpenner.com has lots of tutorials and pdfs on how easing work
 */
class Easing{
    
    //Continue here:
        //Separate out all the easing classes.
        //Try to do Easing.Bounce.easeInBounce etc. maybe?
    
    
    
	//Quadratic
    static func easeInQuad(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        t = t/d
		return c*t*t + b
	}
    static func easeOutQuad(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        t = t/d
		return -c*t*(t-2) + b
	}
    static func easeInOutQuad(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        t = t / d * 2
        if t < 1 {
            return c / 2 * t * t + b
        }
        return -c / 2 * ((t - 1) * (t - 3) - 1) + b
	}
    static func easeOutInQuad ( _ t: CGFloat, _ b: CGFloat, _ c: CGFloat, _ d: CGFloat) -> CGFloat {
        if t < d / 2 {
            return easeOutQuad(t * 2,  b, c / 2,  d)
        }
        return easeInQuad((t * 2) - d,  b + c / 2,  c / 2,  d)
    }
}

/*
/**
* NOTE: If you decrease the decimal variable you increase the friction effect
*/
static func easeOut(value : CGFloat, _ from:CGFloat, _ to:CGFloat) -> CGFloat {
let distToGoal:CGFloat = NumberParser.relativeDifference(value, to)
let val:CGFloat = 0.2 * distToGoal
return val
}

*/

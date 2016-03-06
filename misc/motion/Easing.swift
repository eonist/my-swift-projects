
/**
 * t: time (current frame) this can also be actual time
 * b: begin (the value it is at the begining)
 * c: change (end value - begining value) sort of the amount to change, this can also be described as the difference between two values
 * d: duration (total frames in anim) this can also be actual time
 */
class Easing{
    class func easeLinear (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{//Think line in graph: y = x
        return c*t/d + b;
    }
    //Sine
    class func easeInSine (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c * cos(t/d * π2) + c + b;
    }
    class func easeOutSine (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c * sin(t/d * π2) + b;
    }
    class func easeInOutSine (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c/2 * (cos(π*t/d) - 1) + b;
    }
    //Quintic
    class func easeInQuint (var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        t = t/d
        return c*(t/=d)*t*t*t*t + b;
    }
	class func easeOutQuint (var t:Number, b:Number, c:Number, d:Number):CGFloat{
		t = t/d-1
		return c*(t*t*t*t*t + 1) + b;
	}
}

/*
/**
* NOTE: If you decrease the decimal variable you increase the friction effect
*/
class func easeOut(value : CGFloat, _ from:CGFloat, _ to:CGFloat) -> CGFloat {
let distToGoal:CGFloat = NumberParser.relativeDifference(value, to)
let val:CGFloat = 0.2 * distToGoal
return val
}

*/
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
        //seperate out all the easing classes. 
        //Try to do Easing.Bounce.easeInBounce etc. maybe?
    
    //Quintic - QUINTIC EASING: t^5
    static func easeInQuint(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t/d
        return c*t*t*t*t*t + b
    }
    static func easeOutQuint(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t/d-1
		return c*(t*t*t*t*t + 1) + b
	}
    static func easeInOutQuint(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat {
        var t = t
        t = t/(d/2)//<--the brackets are important
		if (t < 1) {return c/2*t*t*t*t*t + b}
        t = t-2
		return c/2*(t*t*t*t*t + 2) + b
	}
    //Quartic
    static func easeInQuart(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = t/d
        return c*t*t*t*t + b
    }
    static func easeOutQuart(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var t = t
        t = (t/d)-1//<--the brackets are important
		return -c * (t*t*t*t - 1) + b
	}
    static func easeInOutQuart(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        var t = t
        t = t/(d/2)//<--the brackets are important
		if (t < 1) {return c/2*t*t*t*t + b}
		t = t-2
		return -c/2 * (t*t*t*t - 2) + b
	}
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
   
    /*Elastic*/
    private static func easeInElastic(){
        /*var s:Number;
        if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
        if (!a || a < Math.abs(c)) { a=c; s=p/4; }
        else s = p/PI_M2 * Math.asin (c/a);
        return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*PI_M2/p )) + b;*/
    }
    private static func easeOutElastic(){
        /*var s:Number;
        if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
        if (!a || a < Math.abs(c)) { a=c; s=p/4; }
        else s = p/PI_M2 * Math.asin (c/a);
        return (a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*PI_M2/p ) + c + b);*/
    }
    private static func easeInOutElastic(){
        /*var s:Number;
        if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
        if (!a || a < Math.abs(c)) { a=c; s=p/4; }
        else s = p/PI_M2 * Math.asin (c/a);
        if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*PI_M2/p )) + b;
        return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*PI_M2/p )*.5 + c + b;*/
    }
    /*Circular*/
    private static func easeInCircular(){
        //return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
    }
    private static func easeOutCircular(){
        //return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
    }
    private static func easeInOutCircular(){
        /*
        if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
        return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
        */
    }
    //Back
    private static func easeInBack(){
        //return c*(t/=d)*t*((s+1)*t - s) + b;
    }
    private static func easeOutBack(){
        //return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
    }
    private static func easeInOutBack(){
        /*if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
        return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;*/
    }
    private static func easeInCubic(){
        //c*(t/=d)*t*t + b;
    }
    private static func easeOutCubic(){
        //return c*((t=t/d-1)*t*t + 1) + b;
    }
    private static func easeInOutCubic(){
        /*if ((t/=d/2) < 1) return c/2*t*t*t + b;
        return c/2*((t-=2)*t*t + 2) + b;*/
    }
}
class Linear{
    //No easing, linear animation
    static func easeLinear(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{//Think line in graph: y = x
        return c*t/d + b
    }
}
class Sine{
    //Sine SINUSOIDAL EASING: sin(t)
    static func easeInSine(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c * cos(t/d * π2) + c + b
    }
    static func easeOutSine(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c * sin(t/d * π2) + b
    }
    static func easeInOutSine(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c/2 * (cos(π*t/d) - 1) + b
    }
    static func easeOutInSine (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        if t < d / 2 {
            return easeOutSine(t * 2,  b,  c / 2,  d)
        } else {
            return easeInSine((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
    }
}
/*Bounce*/
class Bounce{
    static func easeInBounce(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        return c - easeOutBounce(d - t, 0, c, d) + b
    }
    static func easeOutBounce(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        var t = t
        t = t / d
        if t < 1 / 2.75 {
            return c * (7.5625 * t * t) + b
        } else if t < 2 / 2.75 {
            t = t - (1.5 / 2.75)
            return c * (7.5625 * t * t + 0.75) + b
        } else if t < 2.5 / 2.75 {
            t = t - (2.25 / 2.75 )
            return c * (7.5625 * t * t + 0.9375) + b
        } else {
            t = t - (2.625 / 2.75 )
            return c * (7.5625 * t * t + 0.984375) + b
        }
    }
    static func easeInOutBounce(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        if t < d / 2 {
            return easeInBounce(t * 2, 0, c, d) * 0.5 + b
        } else {
            return easeOutBounce(t * 2 - d, 0, c, d) * 0.5 + c * 0.5 + b
        }
    }
    static func easeOutInBounce(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
        if t < d / 2 {
            return easeOutBounce(t * 2, b, c / 2, d)
        } else {
            return easeInBounce((t * 2) - d, b + c / 2, c / 2, d)
        }
    }
}
class Expo{
    //Exponential
    static func easeInExpo(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b
    }
    static func easeOutExpo(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        return (t==d) ? b+c : c * (-pow(2, -10 * t/d) + 1) + b
    }
    static func easeInOutExpo(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        var t = t
        if (t == 0) {return b}
        if (t == d) {return b+c}
        t = t / d * 2
        if (t < 1){ return c/2 * pow(2, 10 * (t - 1)) + b}
        t = t - 1
        return c/2 * (-pow(2, -10 * t) + 2) + b
    }
    static func easeOutInExpo (_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
        if t < d / 2 {
            return easeOutExpo(t * 2, b,  c / 2,  d)
        } else {
            return easeInExpo((t * 2) - d,  b + c / 2,  c / 2,  d)
        }
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

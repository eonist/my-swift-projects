import Foundation

class Back {
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
}

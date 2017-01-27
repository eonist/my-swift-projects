import Foundation

class Cubic {
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

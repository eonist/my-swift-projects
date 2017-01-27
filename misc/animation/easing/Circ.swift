import Foundation

class Circ {
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
}

import Foundation
/*Elastic*/
class Elastic {
    private static func easeInElastic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        var s:Number;
         if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
         if (!a || a < abs(c)) { a=c; s=p/4; }
         else s = p/PI_M2 * Math.asin (c/a);
         return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*PI_M2/p )) + b;
    }
    private static func easeOutElastic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        /*var s:Number;
         if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
         if (!a || a < Math.abs(c)) { a=c; s=p/4; }
         else s = p/PI_M2 * Math.asin (c/a);
         return (a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*PI_M2/p ) + c + b);*/
    }
    private static func easeInOutElastic(_ t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        /*var s:Number;
         if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
         if (!a || a < Math.abs(c)) { a=c; s=p/4; }
         else s = p/PI_M2 * Math.asin (c/a);
         if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*PI_M2/p )) + b;
         return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*PI_M2/p )*.5 + c + b;*/
    }
}

import Foundation

class Resizer {
    /**
     * Fits inside a frame (Scales to ratio)
     * Bssically used to get a new size that fits inside size, and has the correct ratio
     * Example: fit(CGSize(200,200)ratio:0.5)//CGSie(100,200)
     */
    static func fit(_ size:CGSize,  ratio:CGFloat)->CGSize{
        let w:CGFloat = size.width
        let h:CGFloat = size.height
        if (w/h) > ratio {
            //Swift.print("w is wider than ratio allows")
            return CGSize(h*ratio,h)
        }else if (w/h) < ratio {
            //Swift.print("h is taller than ratio allows")
            return CGSize(w,w * ratio)
        }else{
            return CGSize(w,h)
        }
    }
    /**
     * Always fills a frame
     * TODO:  ⚠️️  do this laster
     */
    static func zoom(){
        //Implement later when needed, it's almost the same as fit
    }
}

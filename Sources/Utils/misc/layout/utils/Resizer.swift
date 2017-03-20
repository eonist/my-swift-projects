import Foundation

class Resizer {
    /**
     * Fits inside a frame (Scales to ratio)
     */
    static func fit(_ size:CGSize, _ ratio:CGFloat)->CGSize{
        let w:CGFloat = size.width
        let h:CGFloat = size.height
        if((w/h) > ratio){
            //Swift.print("w is wider than ratio allows")
            return CGSize(h*ratio,h)
        }else if((w/h) < ratio){
            //Swift.print("h is taller than ratio allows")
            return CGSize(w,w * ratio)
        }else{
            return CGSize(w,h)
        }
    }
    /**
     * Always fills a frame
     */
    static func zoom(){
        //Implement later when needed, it's almost the same as fit
    }
}
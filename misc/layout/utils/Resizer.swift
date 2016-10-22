import Foundation

class Resizer {
    /**
     * Fits inside a frame
     */
    static func fit(size:CGSize, _ ratio:CGFloat)->CGSize{
        //Scale to ratio:
        let w:CGFloat = size.width
        let h:CGFloat = size.height
        //Swift.print("ratio: " + "\(ratio)")
        //Swift.print("(w/h): " + "\((w/h))")
        if((w/h) > ratio){
            //Swift.print("w is wider than ratio allows")
            return CGSize(h*ratio,h)
        }else if((w/h) < ratio){
            //Swift.print("h is taller than ratio allows")
            return CGSize(w,w*ratio)
        }else{
            return CGSize(w,h)
        }
    }
    /**
     * Allways fills a frame
     */
    static func zoom(){
        //Implement later when needed, its almost the same as fir
    }
}

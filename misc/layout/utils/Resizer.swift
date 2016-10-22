import Foundation

class Resizer {
    func fit(size:CGSize, ratio:CGFloat){
        //Scale to ratio:
        let ratio:CGFloat = 4/3
        Swift.print("ratio: " + "\(ratio)")
        Swift.print("(w/h): " + "\((w/h))")
        if((w/h) > ratio){
            Swift.print("w is wider than ratio allows")
            graphArea!.setSize(h*ratio,h)
        }else if((w/h) < ratio){
            Swift.print("h is taller than ratio allows")
            graphArea!.setSize(w,w*ratio)
        }else{
            graphArea!.setSize(w,h)
        }
    }
}

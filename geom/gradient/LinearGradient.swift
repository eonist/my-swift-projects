import Foundation

public class LinearGradient:Gradient2 {
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],rotation:CGFloat = 1.5707963267949){
        super.init(colors, locations,rotation)
    }
}

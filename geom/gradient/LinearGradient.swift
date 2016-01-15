import Foundation

public class LinearGradient:Gradient2 {
    public var p1:CGPoint?/*<--temp*/
    public var p2:CGPoint?
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ p1:CGPoint? = nil, _ p2:CGPoint? = nil){
        self.colors = colors
        if (locations.count == 0/* && colors.count > 0*/) {//add support for nil aswell
            //Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)
            //Swift.print(self.locations)
        }else{
            self.locations = locations
        }
    }
}

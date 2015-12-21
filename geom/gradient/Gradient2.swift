import Foundation
/**
 * The overall goal of this class is to provide a universal way to define gradients on a graphic. IMPORTANT ->>> So that if you scale the graphic the gradient will not look strange. <<<- IMPORTANT
 * EXAMPLE: let gradient:Gradient = Gradient([NSColor.blueColor().CGColor,NSColor.redColor().CGColor])
 */
class Gradient2 {
    var colors:Array<CGColor>
    var locations:Array<CGFloat>
    var rotation:CGFloat;/*this doesnt belong here, you apply rotations in the matrix, for now its fine*/
    init(_ colors:Array<CGColor> = [], _ locations:Array<CGFloat> = [],_ rotation:CGFloat = 1.5707963267949/*4.71238898038469*/){/*,*/
        self.colors = colors
        if (locations.count == 0/* && colors.count > 0*/) {//add support for nil aswell
            //Swift.print(colors.count)
            self.locations = CGFloatParser.interpolatedRange(0,  1,  colors.count)/*if locations isnt provided the locations will be automatically created from zero to one*/
            //Swift.print(self.locations)
        }else{
            self.locations = locations
        }
        
        self.rotation = rotation
    }
}

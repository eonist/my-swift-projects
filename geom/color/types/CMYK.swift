import Foundation
class CMYK {
    var c:CGFloat
    var m:CGFloat
    var y:CGFloat
    var k:CGFloat
    init(_ c:CGFloat = 0, _ m:CGFloat = 0, _ y:CGFloat = 0, _ k:CGFloat = 0) {
        self.c = c
        self.m = m
        self.y = y
        self.k = k
    }
}
extension CMYK{
    var rgb:RGB {return RGBParser.rgb(self)}
    var rgb2:RGB {return RGBParser.rgb2(self)}
}
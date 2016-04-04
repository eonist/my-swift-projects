import Foundation

class HSBColor {
   
    private var hueValue:CGFloat
        var saturation:CGFloat
        var brightness:CGFloat
        init(_ hue:CGFloat = NaN, _ saturation:CGFloat = NaN, _ brightness:CGFloat = NaN) {
        self.hueValue = hue
        self.saturation = saturation
        self.brightness = brightness
    }
}
extension HSBColor{
    var hue:CGFloat{get{return self.hueValue}set{self.hueValue = newValue % 360}}
}
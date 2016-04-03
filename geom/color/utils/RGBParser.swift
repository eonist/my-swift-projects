import Foundation

class RGBParser {
    /**
     *  Converts an HSB color specified by the parameters to a uint RGB color.
     *  @param hue The hue. 0-360
     *  @param saturation The saturation. 0-1
     *  @param brightness The brightness. 0-1
     *  @return An RGB color.
     *  @Example: rgbByHue(360,1,1);//0xFF0000
     *  // :TODO: rename to rgbValueByHsb?!?
     */
    class func rgbByHsb(hue:Number, saturation:Number, brightness:Number):uint {
        
        var r:Number, g:Number, b:Number;
        if (saturation == 0) r = g = b = brightness;
        else {
            var h:Number = (hue % 360) / 60;
            var i:int = int(h);
            var f:Number = h - i;
            var p:Number = brightness * (1 - saturation);
            var q:Number = brightness * (1 - (saturation * f));
            var t:Number = brightness * (1 - (saturation * (1 - f)));
            switch (i) {
                case 0:
                    r = brightness;
                    g = t;
                    b = p;
                    break; 
                case 1:
                    r = q;                    
                    g = brightness;
                    b = p;
                    break; 
                case 2:
                    r = p;
                    g = brightness;
                    b = t; 
                    break;
                case 3:
                    r = p;
                    g = q;
                    b = brightness;
                    break; 
                case 4:
                    r = t;
                    g = p;
                    b = brightness; 
                    break;
                case 5: 
                    r = brightness;
                    g = p;
                    b = q;
                    break;
            }
        }
        r *= 255;
        g *= 255;
        b *= 255;
        return (r << 16 | g << 8 | b);
    }
}

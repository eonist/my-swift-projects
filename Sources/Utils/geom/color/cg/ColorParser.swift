import Cocoa

class ColorParser {
    /**
     *
     */
    static func randomColor()-> NSColor{
        let r:CGFloat  = CGFloat(arc4random() % 255) / 255.0//Swift 3 upgrade, -> was rand()
        let g:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let b:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let nsColor:NSColor = NSColor(calibratedRed: r, green: g, blue: b, alpha: 1)
        return nsColor
    }
    /**
     * Returns a random CGColor
     */
    static func random()->CGColor{
        let r:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let g:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let b:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let color:CGColor  = CGColor(red: r, green: g, blue: b, alpha: 1.0)
        return color
    }
    CGFloat XBInterpolate(CGFloat value, CGFloat start, CGFloat end)
    {
    return start + (end - start) * value;
    }
    /**
     *
     */
    static func interpolate(_ a:NSColor,_ b:NSColor) ->NSColor{
        + (NSColor *)interpolateFrom:(NSColor *)fromColor to:(NSColor *)toColor percentage:(float)percentage
        {
            NSColor *fromRGBColor = [fromColor colorUsingColorSpace:[NSColorSpace genericRGBColorSpace]];
            NSColor *toRGBColor = [toColor colorUsingColorSpace:[NSColorSpace genericRGBColorSpace]];
            
            float red = XBInterpolate(percentage, [fromRGBColor redComponent], [toRGBColor redComponent]);
            float green = XBInterpolate(percentage, [fromRGBColor greenComponent], [toRGBColor greenComponent]);
            float blue = XBInterpolate(percentage, [fromRGBColor blueComponent], [toRGBColor blueComponent]);
            float alpha = XBInterpolate(percentage, [fromRGBColor alphaComponent], [toRGBColor alphaComponent]);
            
            return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
        }
//        let ciColor:CIColor = CIColor(color: nsColor)!
//        return RGB(ciColor.red*255,ciColor.green*255,ciColor.blue*255)
        
//        a.redComponent
//
        
//
//        a.inter
//            - (UIColor *)colorByInterpolatingWith:(UIColor *)color factor:(CGFloat)factor {
//                factor = MIN(MAX(t, 0.0), 1.0);
//                
//                const CGFloat *startComponent = CGColorGetComponents(self.CGColor);
//                const CGFloat *endComponent = CGColorGetComponents(color.CGColor);
//                
//                float startAlpha = CGColorGetAlpha(self.CGColor);
//                float endAlpha = CGColorGetAlpha(color.CGColor);
//                
//                float r = startComponent[0] + (endComponent[0] - startComponent[0]) * factor;
//                float g = startComponent[1] + (endComponent[1] - startComponent[1]) * factor;
//                float b = startComponent[2] + (endComponent[2] - startComponent[2]) * factor;
//                float a = startAlpha + (endAlpha - startAlpha) * factor;
//                
//                return [UIColor colorWithRed:r green:g blue:b alpha:a];
//        }
    }
}

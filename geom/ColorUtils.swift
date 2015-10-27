import Cocoa

class ColorUtils {
   
    /**
    *
    */
    class func  nsColor(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        let rgba = NSColor.init(calibratedRed: r/255, green: g/255, blue: b/255, alpha: <#T##CGFloat#>)
        
        #define NSColorFromRGB(rgbValue) [NSColor colorWithCalibratedRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
    }
    
}
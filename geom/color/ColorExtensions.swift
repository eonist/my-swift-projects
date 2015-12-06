import Cocoa

extension NSColor{
    /**
     * EXAMPLE: :NSColor(NSColor.blackColor(),0.5)//outputs a black color with 50% transperancy
     */
    convenience init(_ color:NSColor,_ alpha:CGFloat/*0.0 - 1.0*/){
        self.init(red: color.redComponent, green: color.greenComponent, blue: color.blueComponent, alpha: alpha)
    }
}

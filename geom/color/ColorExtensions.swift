import Cocoa

extension NSColor{
    /**
     * EXAMPLE: :NSColor(NSColor.blackColor(),0.5)//outputs a black color with 50% transparancy
     */
    convenience init(_ color:NSColor,_ alpha:CGFloat/*0.0 - 1.0*/){
        let ciColor:CIColor = CIColor(color: color)!
        self.init(red: ciColor.red, green: ciColor.green, blue: ciColor.blue, alpha: alpha)
    }
}

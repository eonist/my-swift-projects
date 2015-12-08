import Cocoa

extension NSShadow {
    convenience init(_ color:NSColor,_ offsetX:CGFloat,_ offsetY:CGFloat,_ blurRadius:CGFloat){
        self.init()
        self.shadowColor = color
        self.shadowOffset = NSMakeSize(offsetX,offsetY)
        self.shadowBlurRadius = blurRadius
    }
}
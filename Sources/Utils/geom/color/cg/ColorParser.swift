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
}
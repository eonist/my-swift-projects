import Cocoa

class SVGFillStyleConverter{
    /**
     *
     */
    class func fillStyle(style:SVGStyle)-> IFillStyle{
        
    }
    /**
     *
     */
    class func fillColor(style:SVGStyle)->NSColor{
        //Swift.print("SVGGraphic.beginFill() color")
        let colorVal:Double = !(style.fill as! Double).isNaN ? style.fill as! Double : Double(0x000000)
        //Swift.print("colorVal: " + "\(colorVal)")
        let opacity:CGFloat = style.fillOpacity != nil && !style.fillOpacity!.isNaN ? style.fillOpacity! : 1
        let color:NSColor = NSColorParser.nsColor(UInt(colorVal), opacity)
        //Swift.print("color: " + "\(color)")
        return color
    }
}

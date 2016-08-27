import Cocoa
/**
 * TODO: //see if you have some method in legacy code for copying linestyles
 */
class LineStyle:ILineStyle {
    var color: NSColor
    var thickness: CGFloat
    var lineCap: CGLineCap
    var lineJoin: CGLineJoin
    var miterLimit: CGFloat
    
    init(_ thickness:CGFloat = 1,_ color:NSColor = NSColor.blackColor(), _ lineCap:CGLineCap = CGLineCap.Butt, _ lineJoin:CGLineJoin =  CGLineJoin.Miter, _ miterLimit:CGFloat = 10){
        self.thickness = thickness
        self.color = color
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
    }
}
import Cocoa
/**
 * TODO: //see if you have some method in legacy code for copying linestyles
 */
class LineStyle:ILineStyle {
    var color:NSColor
    var thickness:CGFloat
    var lineCap:CGLineCap
    var lineJoin:CGLineJoin
    var miterLimit:CGFloat
    var phase:CGFloat/*start of the dash*/
    var lengths:Array<CGFloat>/*gap,length,gap,length, etc*/
    init(_ thickness:CGFloat = 1,_ color:NSColor = NSColor.blackColor(), _ lineCap:CGLineCap = CGLineCap.Butt, _ lineJoin:CGLineJoin =  CGLineJoin.Miter, _ miterLimit:CGFloat = 10,_ phase:CGFloat = 0, _ lengths:Array<CGFloat> = []){
        self.thickness = thickness
        self.color = color
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.phase = phase
        self.lengths = lengths
    }
}
import Cocoa

class DashedLineStyle:LineStyle {
    var phase: CGFloat/*start of the dash*/
    var lengths: Array<CGFloat>/*gap,length,gap,length, etc*/
    init(_ thickness: CGFloat, _ color: NSColor, _ lineCap: CGLineCap, _ lineJoin: CGLineJoin, _ miterLimit: CGFloat, _ phase:CGFloat, _ lengths:Array<CGFloat>) {
        self.phase = phase
        self.lengths = lengths
        super.init(thickness, color, lineCap, lineJoin, miterLimit)
    }
}
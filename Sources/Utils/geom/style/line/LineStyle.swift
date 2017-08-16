import Cocoa
/**
 * TODO: See if you have some method in legacy code for copying linestyles
 * TODO: Candidate for struct. Use IFillStyle as a base protocol
 */
class LineStyle:LineStylable {
    var color:NSColor
    var thickness:CGFloat
    var lineCap:CGLineCap
    var lineJoin:CGLineJoin
    var miterLimit:CGFloat
    var phase:CGFloat/*start of the dash*/
    var lengths:[CGFloat]/*gap,length,gap,length, etc*/
    init(_ thickness:CGFloat = 1,_ color:NSColor = .black, _ lineCap:CGLineCap = .butt, _ lineJoin:CGLineJoin =  .miter, _ miterLimit:CGFloat = 10,_ phase:CGFloat = 0, _ lengths:[CGFloat] = []){
        self.thickness = thickness
        self.color = color
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.phase = phase
        self.lengths = lengths
    }
}

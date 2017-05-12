import Foundation
/**
 * This class creates an arc
 * EXAMPLE: <path id="instance4200" d="M300 340 a80 80 0 0 1 160 0" stroke="#0000FF" fill="none"/>
 * TODO: Candidate for struct
 */
class SVGArc:SVGGraphic {
    var start:CGPoint/*absolute*/
    var end:CGPoint/*absolute*/
    var radii:CGPoint
    var rotation:CGFloat
    var largeFlag:CGFloat
    var sweepFlag:CGFloat
    init(_ start:CGPoint, _ radii:CGPoint, _ rotation:CGFloat, _ largeFlag:CGFloat, _ sweepFlag:CGFloat, _ end:CGPoint, _ style:SVGStyle? = nil, _ id:String? = nil) {
        self.start = start
        self.radii = radii
        self.rotation = rotation
        self.largeFlag = largeFlag
        self.sweepFlag = sweepFlag
        self.end = end
        super.init(style, id)
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

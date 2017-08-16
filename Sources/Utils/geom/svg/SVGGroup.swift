import Foundation
/**
 * SVGGroup is like SVGContainer but differs by also holding a SVGStyle
 */
class SVGGroup:SVGContainer, SVGViewable {
    var style:SVGStyle?
    init(_ items:[SVGElementKind], _ style:SVGStyle?, _ id:String){
        self.style = style
        super.init(items, id)
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

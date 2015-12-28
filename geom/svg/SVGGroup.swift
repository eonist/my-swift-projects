import Foundation
/**
 * SVGGroup is like SVGContainer but differs by also holding a SVGStyle
 */
class SVGGroup : SVGContainer, ISVGView {
    var style : SVGStyle;
    init(items:Array, style:SVGStyle, id:String){
        super.init(items, id)
    }
}

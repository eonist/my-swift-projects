import Foundation
/**
 * SVG class is where other svg elements are added 
 * TODO: ⚠️️Implement xmlns:xlink,viewBox,enable-background,xml:space
 * //preserveAspectRatio="xMinYMin meet"
 * //viewBox="0 0 90 90"
 * EXAMPLE:
 * <?xml version="1.0"?><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="768px" height="768px">
 * 		<rect x="64" y="64" fill="#0000FF" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 * </svg>
 */
class SVG:SVGContainer{// :TODO: ⚠️️ (SVG should be split into SVGView and SVG...something els)
    var version:CGFloat
    var nameSpace:String
    var xVal:CGFloat
    var yVal:CGFloat
    var width:CGFloat
    var height:CGFloat
    init(_ items:[SVGElementKind], _ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat,_ version:CGFloat,_ nameSpace:String,_ id:String) {
        self.xVal = x
        self.yVal = y
        self.width = width
        self.height = height
        self.version = version
        self.nameSpace = nameSpace
        super.init(items,id)
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

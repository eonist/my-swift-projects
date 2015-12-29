import Foundation
/**
 * SVG class is where pther svg elemnts is added
 * // :TODO: impliment xmlns:xlink,viewBox,enable-background,xml:space,
 * //preserveAspectRatio="xMinYMin meet"
 * //viewBox="0 0 90 90"
 * @example
 * <?xml version="1.0"?><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="768px" height="768px">
 * 		<rect x="64" y="64" fill="#0000FF" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 * </svg>
 */
class SVG : SVGContainer{// :TODO: (SVG should be split into SVGView and SVG...something els)
    var version:CGFloat
    var nameSpace:String
    var x:CGFloat
    var y:CGFloat
    var width:CGFloat
    var height:CGFloat
    public function SVG(items:Array, x:Number,y:Number,width:Number,height:Number,version:Number,nameSpace:String,id:String) {
        super(items,id);
        _x = x;
        _y = y;
        _width = width;
        _height = height;
        _version = version;
        _nameSpace = nameSpace;
    }
}
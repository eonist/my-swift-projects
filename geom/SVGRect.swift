import Foundation
/*
 *Creates a rectangle instance
 * @example <rect x="64" y="64" fill="none" stroke="#000000" stroke-miterlimit="10" width="512" height="512"/>
 * // :TODO: possibly replace the subclassing with decoration!?!
 */
class SVGRect {
    var width : CGFloat
    var height : CGFloat
    var x:CGFloat
    var y : CGFloat
    var rx : CGFloat/*for round rect, radius*/
    var ry : CGFloat/*for round rect, radius*/
    /**
    * @param fill (is of type Number so that we can test for NaN when parsing to svg xml)
    */
    init(width:Number,height:Number, x:Number, y:Number ,rx:Number , ry:Number, style:SVGStyle, id:String) {
        _width = width;
        _height = height;
        _x = x;
        _y = y;
        _rx = rx;
        _ry = ry;
        super(style,id);
    }
}

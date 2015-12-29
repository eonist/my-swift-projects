import Foundation

/**
 * @author beyondnorth.com
 * This class serves as a base class for other svg graphic types
 * // :TODO: Test what the default stroke-width and stroke-color for path is by importing a path without these properties into illustrator (the answer is that fill becomes black and stroke not applied)
 */
class SVGPathGraphic : SVGGraphic {
    var pathShape:Shape;
    override init(_ style : SVGStyle? = nil, _ id : String? = nil) {
        pathShape = addChild(new Shape()) as Shape;
        super.init(style, id);
    }
    override public function clear() : void {
        super.clear();//clears the stroke
        _pathShape.graphics.clear();//clears the fill
    }
    override public function applyLineStyle():void {
        if(style != null && !isNaN(style.stroke)) SVGGraphicModifier.applyStrokeStyle(_pathShape.graphics,style);/*updates only if style.stroke is of the class SVGStrokeStyle*/
    }
}

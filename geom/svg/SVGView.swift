import Cocoa
/**
 * SVGDisplayObject impliments the same interface as ISVGElement and also the style params in ISVGDisplayObject and extends Sprite so that it can be seen on stage
 */
class SVGView : NSView{
    var style : SVGStyle;
    var id : String;
    init(style:SVGStyle, id:String) {
        self.style = style;
        self.id = id;
    }

    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

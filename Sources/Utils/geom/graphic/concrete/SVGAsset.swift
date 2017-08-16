import Cocoa
/**
 * TODO: Remember to add the cglayer settings so that this class can have children that is visible etc
 * TODO: You need to think how you can add trackingareas to all svg children aswell and subsequent hitTest, just get the bounds and assert isWithinPath in a tree-search
 */
class SVGAsset:InteractiveView {
    var svg:SVG
    var path:String
    init(_ path:String) {
        self.path = path
        let rootElement:XML = FileParser.xml(path.tildePath)
        svg = SVGParser.svg(rootElement)
        super.init(frame:NSRect())
        isInteractive = false/*<-- Very important, as SVG interactivity is currently not supported*/
        /*
        self.wantsLayer = true/*if true then view is layer backed*/
        layer = CALayer()/*needs to be layer-hosted so that we dont get clipping of children, or not!*/
        layer!.masksToBounds = false//this is needed!!!, seems not to be needed!
        */
        addSubview(svg)
    }
    /**
     * You only scale when you init the svg
     */
    func scale(_ x:CGFloat, _ y:CGFloat, _ width:CGFloat, _ height:CGFloat){
        let scale:CGPoint = CGPoint(width/svg.width,height/svg.height)//<---Why is this working? could be because you have tested only with square svg files
        SVGModifier.scale(svg, CGPoint(0,0), scale)
        svg.frame.origin = CGPoint(x,y)
    }
    func applyStyle(_ fillStyle:FillStyleKind?,_ lineStyle:LineStylable?){
        let svgStyle = Utils.svgStyle(fillStyle, lineStyle)
        SVGModifier.style(svg, svgStyle)
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
private class Utils{
    /**
     * NOTE: This method is here because This framework uses swift-utils and SVGLib. Neither of them uses either of them. Think coupling etc
     */
    static func svgStyle(_ fillStyle:FillStyleKind?,_ lineStyle:LineStylable?)->SVGStyle{
        let fill:Any? = fillStyle?.color.hexVal
        let fillOpacity:CGFloat? = fillStyle?.color.alphaComponent
        let fillRule:String? = nil
        let strokeWidth:CGFloat? = lineStyle?.thickness
        let stroke:Any? = lineStyle != nil && lineStyle?.color != NSColor.clear/*<--TODO: add this check to fill.color aswell*/ ? lineStyle!.color : nil
        let strokeOpacity:CGFloat? = lineStyle?.color.alphaComponent
        let strokeLineCap:String? = lineStyle != nil ? LineStyleParser.lineCapType(lineStyle!.lineCap) : nil
        let strokeLineJoin:String? = lineStyle != nil ? LineStyleParser.lineJoinType(lineStyle!.lineJoin) : nil
        let strokeMiterLimit:CGFloat? = lineStyle?.miterLimit
        return SVGStyle(fill,fillOpacity,fillRule,strokeWidth,stroke,strokeOpacity,strokeLineCap,strokeLineJoin,strokeMiterLimit)
    }
}

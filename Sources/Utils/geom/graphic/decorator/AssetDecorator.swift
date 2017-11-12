import Cocoa
/*
 * TODO: this solution isn't perfect but it works for now. See legacy code for a better solution, the svg should become the graphic maybe?
 * NOTE: asset is svg for now but in the future it should support png
 * TODO: ⚠️️ To add reSize on style/state change you need to store the init size of SVGAsset to scale correctly
 */
class AssetDecorator:SizeableDecorator{
    var asset:SVGAsset?
    var _hasAssetURLUpdated:Bool = true
    var _assetURL:String
    var assetURL:String {//use will set did set instead?
        get{
            return _assetURL
        }set{
            _hasAssetURLUpdated = _assetURL != newValue
            _assetURL = newValue
        }
    }
    init(_ decoratable:GraphicDecoratableKind,_ iconURL:String) {//this should be provided through an extension not here->  = BaseGraphic(FillStyle(NSColor.greenColor())
        _assetURL = iconURL
        super.init(decoratable)
        graphic.fillShape.frame = NSRect(0,0,1,1)/*<--temp fix, the frame needs to have a width and height or else the shadow won't be applied, this may not be the case anymore*/
    }
    override func draw() {
        if(_hasAssetURLUpdated){
            if(asset != nil) {asset!.removeFromSuperview()}/*temp solution, find a more elegant solution than removing*/
            asset = graphic.addSubView(SVGAsset(assetURL))/*temp solution*/
            asset!.scale(x, y, width, height)
        }
        asset?.svg.frame.origin = CGPoint(x,y)/*offset*/
        if(graphic.fillStyle!.color != NSColor.clear) {asset!.applyStyle(graphic.fillStyle,graphic.lineStyle)}//this applies custom fill and line to the svg
        super.draw()
    }
    override func drawFill() {
        //Swift.print("drawFill")
      /*this method must be overridden*/
    }
    override func drawLine() {
        //Swift.print("drawLine")
        /*this method must be overridden*/
    }
}

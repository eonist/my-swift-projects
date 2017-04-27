import Cocoa
/*
 * TODO: this solution isn't perfect but it works for now. See legacy code for a better solution, the svg should become the graphic maybe?
 * NOTE: asset is svg for now but in the future it should support png
 */
class AssetDecorator:SizeableDecorator{
    var asset:SVGAsset?
    var _hasAssetURLUpdated:Bool = true
    var _assetURL:String
    var assetURL:String {
        get{
            return _assetURL
        }set{
            _hasAssetURLUpdated = _assetURL != newValue
            _assetURL = newValue
        }
    }
    init(_ decoratable:IGraphicDecoratable,_ iconURL:String) {//this should be provided through an extension not here->  = BaseGraphic(FillStyle(NSColor.greenColor())
        _assetURL = iconURL
        //Swift.print("AssetDecorator.init() " + "assetURL: " + "\(assetURL)")
        super.init(decoratable)
        //asset = graphic.addSubView(SVGAsset(assetURL))
        graphic.fillShape.frame = NSRect(0,0,1,1)/*<--temp fix, the frame needs to have a width and height or else the shadow won't be applied*/
    }
    override func draw() {
        Swift.print("AssetDecorator.draw() _hasAssetURLUpdated: \(_hasAssetURLUpdated)")
        if(_hasAssetURLUpdated){
            if(asset != nil) {asset!.removeFromSuperview()}/*temp solution, find a more elegant solution than removing*/
            asset = graphic.addSubView(SVGAsset(assetURL))/*temp solution*/
            if(graphic.fillStyle!.color != NSColor.clear) {asset!.applyStyle(graphic.fillStyle,graphic.lineStyle)}//this applies custom fill and line to the svg
        }
        
        //Continue here: 🏀
            //seems to scale strangly. figure it out
        
        
        super.draw()
    }
    override func drawFill() {
        Swift.print("drawFill.width: " + "\(width)")
        asset!.draw(x, y, width, height)//0, 0, graphic.width, graphic.height
    }
    override func drawLine() {
        /*this method must be overridden*/
    }
}

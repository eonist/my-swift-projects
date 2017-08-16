import Foundation
/**
 * NOTE: the path compile method is the important part in this class
 * IMPORTANT: ⚠️️ You need to manually re-compile the cgPath if you want any update to the path to also reflect the cgPath (you do this before you call draw)
 */
class PathGraphic:SizeableDecorator{
    var path:PathKind
    lazy var cgPath:CGMutablePath = CGPathUtils.compile(CGMutablePath(), self.path)/*This is lazy because both drawFill and drawLine uses it, its risky but convenient*/
    lazy var fillBoundingBox:CGRect = self.cgPath.boundingBoxOfPath/*This is lazy because both drawFill and drawLine uses it, it's risky because it can cause unrelated errors that are hard to debug, but convenient*/
    init(_ path:PathKind, _ decoratable:GraphicDecoratableKind = BaseGraphic(nil,LineStyle())) {
        self.path = path
        super.init(decoratable)
    }
    override func drawFill() {
        fillBoundingBox = cgPath.boundingBoxOfPath/*There is also CGPathGetPathBoundingBox, CGPathGetBoundingBox, which works a bit different, the difference is probably just support for cruves etc*/
        graphic.fillShape.frame = fillBoundingBox/*We need to set frame because this is the lowest level graphic and they must have a frame to be visible*/
        let offset = CGPoint(-fillBoundingBox.x,-fillBoundingBox.y)/*We get the amount of offset need to set the path in (0,0) inside the frame*/
        var offsetPath:CGMutablePath = cgPath.clone()/*We clone the path so that the original isn't modified*/
        graphic.fillShape.path = CGPathModifier.translate(&offsetPath, offset.x, offset.y)/*We translate the path so that its in (0,0) space in the frame, we position the frame not the path so that the drawing is as optimized as can be*/
    }
    override func drawLine() {
        var boundingBox:CGRect = CGPathParser.boundingBox(cgPath, graphic.lineStyle!)/*Regardless if the line is inside outside or centered, this will still work, as the path is already exapnded correctly*/
        graphic.lineShape.frame = boundingBox/*We need to set frame because this is the lowest level graphic and they must have a frame to be visible*/
        let offset = CGPoint(-boundingBox.x,-boundingBox.y)/*We get the amount of offset need to set the path in (0,0) inside the frame*/
        var offsetPath:CGMutablePath = cgPath.clone()/*We clone the path so that the original isn't modified*/
        graphic.lineShape.path = CGPathModifier.translate(&offsetPath, offset.x, offset.y)/*We translate the path so that its in (0,0) space in the frame, we position the frame not the path so that the drawing is as optimized as can be*/
    }
}

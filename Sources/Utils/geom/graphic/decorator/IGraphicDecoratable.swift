import Foundation
@testable import Utils
@testable import Element

/**
 * These are the methods the GraphicDecoratable must implement
 * Differs from IBaseGraphic in that IBaseGraphic has some variables that the decoratables isnt dependent on when it comes to the creation procedure
 */
protocol IGraphicDecoratable:class{/*<--Explain why this extends class*/
    func getDecoratable()->IGraphicDecoratable
    var graphic:BaseGraphic{get}
    func getGraphic() -> BaseGraphic/*Don't revert this variable to a protocol*/
    /*Design*/
    func fill()
    func beginFill()
    func drawFill()
    func stylizeFill()
    func line()
    func applyLineStyle()
    func drawLine()
    func stylizeLine()
    func draw()/*Setup the geometry and init the display process of fill and line*/
}
extension IGraphicDecoratable{
    // StylePropertyParser.lineStyle(self,depth), StylePropertyParser.lineOffsetType(self,depth)

    func fillStyle(_ depth:Int) -> Any{
        return StylePropertyParser.fillStyle(self,depth)
    }
}
/*Size & position*/
/*
 func getSize()->CGSize
 func getPosition()->CGPoint
 func setSize(size:CGSize)
 func setPosition(position:CGPoint)
 */

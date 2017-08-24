import Cocoa
/*
 * The AbstractDecorator has all the decorator methods
 * NOTE: extending NSObject is needed in order to get respondToSelector to work when using the delegate method for the CALayers etc
 */
class AbstractGraphicDecoratable:GraphicDecoratableKind{
    let errMsg:String = "Must be overridden in subClass"
    func getDecoratable()->GraphicDecoratableKind{fatalError(errMsg)}/*news*/
    var graphic:BaseGraphic {fatalError(errMsg)}/*This is only a getter, for now, and dont revert to IBaseGraphic*/
    func getGraphic() -> BaseGraphic{fatalError(errMsg)}
    func draw(){}
    func initFill(){}
    func initLine(){}
    /*Fill*/
    func fill(){}
    func beginFill(){fatalError(errMsg)}
    func drawFill(){fatalError(errMsg)}
    func stylizeFill(){fatalError(errMsg)}
    /*Line*/
    func line(){}
    func applyLineStyle(){fatalError(errMsg)}
    func drawLine(){fatalError(errMsg)}
    func stylizeLine(){fatalError(errMsg)}
}

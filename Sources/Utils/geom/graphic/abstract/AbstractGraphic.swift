import Foundation

class AbstractGraphic:Graphic {
    let errMsg:String = "Must be overridden in subClass"
    func getDecoratable()->GraphicDecoratableKind{fatalError(errMsg)}
    var graphic:BaseGraphic {fatalError(errMsg)}/*This is only a getter, for now, and dont revert to IBaseGraphic*/
    func getGraphic() -> BaseGraphic{fatalError(errMsg)}
    /*override*/ func draw(){}//Swift 3 update. MTKView now occupies draw(), consider renaming it to render()?
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

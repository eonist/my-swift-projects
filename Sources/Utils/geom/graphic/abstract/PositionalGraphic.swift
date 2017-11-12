import Foundation

class PositionalGraphic:GraphicDecoratable,Positional {
    var pos:CGPoint
    init(_ pos:CGPoint,_ decoratable:GraphicDecoratableKind) {
        self.pos = pos
        decoratable.graphic.frame.origin = pos//new
        super.init(decoratable)
    }
    /**
     * NOTE: This method must remain an instance method so that other decorators can override it (Circle, Line, Path, etc)
     */
    func getPosition() -> CGPoint {
        if(pos.x.isNaN){fatalError("x can't be NaN")}
        if(pos.y.isNaN){fatalError("y can't be NaN")}
        return pos
    }
    func setPosition(_ position:CGPoint) {
        if(position.x.isNaN){fatalError("x can't be NaN")}
        if(position.y.isNaN){fatalError("y can't be NaN")}
        self.pos = position
    }
}


import Foundation
/**
 * TODO: Rename to Positional
 */
protocol Positional:class {/*<--new extends class makes it castable w/o creating a copy -> struct has issues with casting etc...*/
    func setPosition(_ position:CGPoint)
    func getPosition() -> CGPoint
}
/**
 * CAUTION: These extensions can only be used if you don't need to cast the instance to ISizeable
 */
extension Positional{
    /*pos was recently moved to the extension since it isn't needed as a variable in the protocol*/
    var pos:CGPoint{/*<-- this is named pos, because the name position is effectivly blocked when using implicit getter and setter names*/
        get{
            return self.getPosition()
        }set{
            self.setPosition(newValue)
        }
    }
    var x:CGFloat{
        get{
            if(self.pos.x.isNaN){fatalError("x can't be NaN")}
            return self.pos.x
        } set{
            if(newValue.isNaN){fatalError("x can't be NaN")}
            self.pos.x = newValue
        }
    }
    var y:CGFloat{
        get{
            if(self.pos.y.isNaN){fatalError("y can't be NaN")}
            return self.pos.y
        } set{
            if(newValue.isNaN){fatalError("y can't be NaN")}
            self.pos.y = newValue
        }
    }
}

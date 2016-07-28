import Foundation
protocol IPositional:class {//<--new extends class
    //pos was recently commented out because it isn't needed!?!?
    
    func setPosition(position:CGPoint)
    func getPosition() -> CGPoint
}
/**
 * CAUTION: These extensions can only be used if you dont need to cast the instance to ISizeable
 */
extension IPositional{
    //var positional:IPositional {get{return self as IPositional}set{}}/*This method provides support for returning a direct pointer when casting to protocol, which swift doesnt do, it only provides an immutable reference, which is unusable when setting mutating variables via extensions*/
    var pos:CGPoint{get{return self.getPosition()} set{self.setPosition(newValue)}}/*<-- this is named pos, because the name position is effectivly blocked when using implicit getter and setter names*/
    var x:CGFloat{get{return self.pos.x} set{self.pos.x = newValue}}
    var y:CGFloat{get{return self.pos.y} set{self.pos.y = newValue}}
    /*func getPosition() -> CGPoint {
    return position
    }*/
    /*mutating func setPosition(x:CGFloat,y:CGFloat){
    self.x = x
    self.y = y
    }*/
    /*mutating func setPosition(position:CGPoint){
    self.position.x = position.x
    self.position.y = position.y
    }*/
}
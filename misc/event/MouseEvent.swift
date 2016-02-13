import Cocoa

//class MouseEventType{
    /*static var over:String = "mouseOver"*/
    /*static var out:String = "mouseOut"*/
    /*static var move:String = "mouseMove"*/
    /*static var down:String = "mouseDown"*/
    /*static var up:String = "mouseUp"*/
    /*static var enter:String = "mouseEnter"*/
    /*static var exit:String = "mouseExit"*/
//}
/**
 * TODO: implement the immidiate when its needed. 
 * NOTE: origin could in the future be a protocol IInteractiveElement for instance or IInteractive or IInteractiveView
 */
class MouseEvent:Event{
    weak var event:NSEvent?
    /*var pos:CGPoint*/
    
    init(_ event:NSEvent/*_ type:String, *//*_ pos:CGPoint, */, _ origin:NSView, _ immediate:AnyObject){
        /*self.pos = pos*/
        self.event = event
        super.init("", origin/*,immediate*/)
    }
}
/**
 * Add convenince variables and methods here:
 */
extension MouseEvent{
    var loc:CGPoint{return event!.locationInWindow}
}
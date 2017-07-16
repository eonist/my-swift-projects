import Cocoa
/**
 * TODO: ⚠️️ Implement the immidiate when it's needed.
 * NOTE: origin could in the future be a protocol IInteractiveElement for instance or IInteractive or IInteractiveView
 */
class MouseEvent:Event{
    static var over:String = "mouseEventOver"
    static var out:String = "mouseEventOut"
    static var move:String = "mouseEventMove"
    static var down:String = "mouseEventDown"
    static var up:String = "mouseEventUp"
    static var enter:String = "mouseEventEnter"
    static var exit:String = "mouseEventExit"
    weak var event:NSEvent?
    init(_ event:NSEvent, _ origin:NSView){
        self.event = event
        super.init("", origin)
    }
}
/**
 * Add convenince variables and methods here:
 */
extension MouseEvent{
    /**
     * IMPORTANT: ⚠️️ This is the position unFlipped coordinatespace (aka bottom left in macOs)
     */
    var loc:CGPoint{return event!.locationInWindow}
    var shiftKey:Bool {return self.event!.shiftKey}/*Convenience*/
    var commandKey:Bool {return self.event!.commandKey}/*Convenience*/
    var altKey:Bool {return self.event!.altKey}/*Convenience*/
    var ctrlKey:Bool {return self.event!.ctrlKey}/*Convenience*/
    //Bonus: There is also FunctionKeyMask
}

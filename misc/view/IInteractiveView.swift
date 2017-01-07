import Foundation

protocol IInteractiveView:IEventSender {
    //func onEvent(event:Event)
    func mouseMoved(event:MouseEvent)
    func mouseOver(event:MouseEvent)
    func mouseOut(event:MouseEvent)
    func mouseDown(event:MouseEvent)
    func mouseUpInside(event:MouseEvent)
    func mouseUpOutside(event:MouseEvent)
    func mouseUp(event:MouseEvent)/*Convenient*/
}
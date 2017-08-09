import Foundation
typealias IInteractiveView = InteractiveViewable
protocol InteractiveViewable:EventSendable {
    //func onEvent(event:Event)
    func mouseMoved(_ event:MouseEvent)
    func mouseOver(_ event:MouseEvent)
    func mouseOut(_ event:MouseEvent)
    func mouseDown(_ event:MouseEvent)
    func mouseUpInside(_ event:MouseEvent)
    func mouseUpOutside(_ event:MouseEvent)
    func mouseUp(_ event:MouseEvent)/*Convenient*/
}

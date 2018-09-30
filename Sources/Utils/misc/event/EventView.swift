class EventView:View,EventSendable{
    lazy var event:EventSendable.CallBack = { (event:Event) in /*returns closure that will take care of propagating the event to the parent*/
        guard let superView:EventSendable = self.superview as? EventSendable else {return}
        superView.onEvent(event)
    }
    /**
     * EXAMPLE: override onEvent in a subClass then assert origin === thumb && event.type == ButtonEvent.down
     */
    func onEvent(_ event:Event){
        self.event(event.setImmediate(self))//the setImmediate attaches the immediate instance to the event.
    }
}

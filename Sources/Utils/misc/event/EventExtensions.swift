import Cocoa

extension Event{
    /**
     * The immediate previouse sender of event
     * NOTE: We return the event as its convenient when chaining method calls, great for attaching self to incoming events
     */
    func setImmediate(_ immediate:AnyObject)->Event{
        self.immediate = immediate
        return self
    }
    /**
     * NOTE: we return the event as its convenient when chaining method calls
     */
    func setType(_ type:String)->Event{
        self.type = type
        return self
    }
    func cast<T>() -> T{/*Convenience*/
        return self as! T
    }
    /**
     * TODO: It would be cool if you could also add a call-back method as an argument, also if it could cary arguments, maybe asking too much
     */
    func assert(_ type:String,_ origin:AnyObject?) -> Bool{
        return self.type == type && self.origin === origin
    }
    
    /**
     * Convenience method for asserting event target
     */
    func assert(_ type:String, immediate:AnyObject?) -> Bool{
        return self.type == type && self.immediate === immediate
    }
    /**
     * Assert if child has ancestry to PARAM: parent
     * NOTE: This way we don't have to store the entire stack in the event.
     */
    func isChildOf(_ parent:NSView?) -> Bool {
        if let origin:NSView = self.origin as? NSView {
            return origin.hasParent(parent)
        }
        return false
    }
}
/**
 * Convenience operators (So you can write less code)
 * EXAMPLE: if(event == (Button.Event,btn1)){/*do something here*/}
 */
func == (l:Event , r:AnyObject?) -> Bool {/*immediate*/
    return l.immediate === r
}
func == (l:Event , r:(eventType:String,immediate:AnyObject?)) -> Bool {/*immediate*/
    return l.type == r.eventType && l.immediate === r.immediate
}
func === (l:Event , r:AnyObject?) -> Bool {/*origin*/
    return l.origin === r
}
func === (l:Event , r:(eventType:String,origin:AnyObject?)) -> Bool {/*origin*/
    return l.type == r.eventType && l.origin === r.origin
}
func == (l:Event , r:String) -> Bool {//??
    return l.type == r
}

import Foundation

extension Event{
    /**
     * The immediate previouse sender of event
     * NOTE: we return the event as its convenient when chaining method calls, great for attaching self to incoming events
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
}
/**
 * Convenience operators (So you can write less code)
 * EXAMPLE: if(event == (Button.Event,btn1)){/*do something here*/}
 */
func == (l:Event , r:AnyObject) -> Bool {//immediate
    return l.immediate === r
}
func == (l:Event , r:(eventType:String,immediate:AnyObject)) -> Bool {//immediate
    return l.type == eventType && l.immediate === r.immediate
}
func === (l:Event , r:AnyObject) -> Bool {//origin
    return l.origin === r
}
func === (l:Event , r:(eventType:String,origin:AnyObject)) -> Bool {//origin
    return l.type == eventType && l.origin === r.origin
}

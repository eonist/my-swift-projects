import Foundation

struct DP:DataProvidable,EventSendable {
    var event:EventCallBack = {return{(event:Event) -> Void in}}()
    func onEvent(_ event:Event){
        //self.event!(event.setImmediate(self))
    }
    var items:[[String:String]]//ideally it should be string,AnyObject//TODO:Maybe make this public getter private setter
    var count:Int{return self.items.count}
    
    init(_ items:[[String:String]] = []){
        self.items = items
        //event = eventCall
    }
}

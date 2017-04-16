import Foundation

struct DP:DataProvidable,EventSendable {
    var event:EventCallBack/*this holds any method assigned to it that has its type*/
    var eventCall:EventCallBack {//TODO:this should probably be private
        return {
            (event:Event) -> Void in
        }
    }
    var items:[[String:String]]//ideally it should be string,AnyObject//TODO:Maybe make this public getter private setter
    var count:Int{return self.items.count}
    
    init(_ items:[[String:String]] = []){
        self.items = items
        event = eventCall
    }
}

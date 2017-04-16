import Foundation

struct DP:DataProvidable,IEventSender {
    var items:[[String:String]]//ideally it should be string,AnyObject//TODO:Maybe make this public getter private setter
    var count:Int{return self.items.count}
    
    init(_ items:[[String:String]] = []){
        self.items = items
    }
}

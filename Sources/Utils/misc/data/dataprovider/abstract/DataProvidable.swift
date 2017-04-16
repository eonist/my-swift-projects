import Foundation


protocol DataProvidable{
    var items:[[String:String]] {get}
    func item(_ at:Int) -> [String:String]?
    var count:Int{get}
    //init(_ items:[[String:String]])
}

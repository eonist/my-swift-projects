import Foundation

protocol DataProvidable{
    var items:[[String:String]]
    func item(_ at:Int) -> [String:String]?
    var count:Int{get}
}

import Foundation

protocol DataProvidable{
    func item(_ at:Int) -> [String:String]?
    var count:Int{get}
}

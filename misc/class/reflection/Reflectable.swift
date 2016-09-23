import Foundation

protocol Reflectable {
    var reflection:(type:String,value:String) {get}
}
extension CGColor:Reflectable{
    var reflection:(type:String,value:String) {
        return (type:"CGColor",value:self.nsColor.hexString)
    }
}
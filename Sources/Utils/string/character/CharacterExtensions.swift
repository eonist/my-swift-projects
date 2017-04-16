import Foundation

extension Character {
    var cgFloat:CGFloat{return CGFloat(Double(String(self))!)}
    var double:Double{return Double(String(self))!}
    var uint:UInt{return UInt(Float(String(self))!)}
    var int:Int{return Int(String(self))!}
}

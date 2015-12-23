import Foundation
/*

Needs more research

extension Array where Element:String{
    /**
     *
     */
    func join(seperator:String)->String{
        return StringModifier.combine(self as! Array<String>,seperator)
    }
}
*/

extension Array {
    func find(fn: (T) -> Bool) -> [T] {
        var to = [T]()
        for x in self {
            let t = x as T;
            if fn(t) {
                to += t
            }
        }
        return to
    }
}
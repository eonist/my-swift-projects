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
    /**
     * Shift
     */
    mutating func shift(/*x:[Element]*/) {
        ArrayModifier.shift(&self)
    }
}
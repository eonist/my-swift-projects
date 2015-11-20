import Foundation

extension Array {
    /**
     *
     */
    func join(seperator:String)->String{
        return StringModifier.combine(self as! Array<String>,seperator)
    }
}

import Foundation

extension Array where Element:String{
    /**
     *
     */
    func join(seperator:String)->String{
        return StringModifier.combine(self,seperator)
    }
}

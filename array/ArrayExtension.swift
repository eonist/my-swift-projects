import Foundation

extension Array/* where Element:String*/{
    /**
     *
     */
    static func join(array:Array<String>, _ seperator:String)->String{
        return StringModifier.combine(array,seperator)
    }
}

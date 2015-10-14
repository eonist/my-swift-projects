import Foundation
class ArrayAsserter {
    /**
     * EXAMPLE: indexOf(["Apples", "Peaches", "Plums"],"Peaches")
     * NOTE: you can also do things like {$0 > 5}
     */
    class func indexOf<T>(arr : [T],str:String)->Int{
        if let index = arr.indexOf({$0 == str}) {
            return index
        }else{
            return -1//-1 indicates non was found
        }
    }
}

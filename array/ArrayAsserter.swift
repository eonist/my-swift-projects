import Foundation
class ArrayAsserter {
    /**
     *
     */
    class func pop<T>(array:[T],obj:T)->Bool {
        
        if array.contains(obj) {
            return true
        } else {
            return false;
        }
    }
}
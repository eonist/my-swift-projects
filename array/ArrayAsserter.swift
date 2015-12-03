import Foundation
class ArrayAsserter {
    /**
     *
     */
    class func contains<T:Equatable>(array:[T],obj:T)->Bool {
        
       return array.contains(obj)
        //continue here
        
        //needs the equatable syntax
        /*
        
        if array.contains(obj) {
            return true
        } else {
            return false;
        }

        */
        return false
    }
}
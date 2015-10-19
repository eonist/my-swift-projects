import Foundation
class ArrayAsserter {
    /**
     *
     */
    class func contains<T>(array:[T],obj:T)->Bool {
        
        
        //continue here
        
        //needs the equatable syntax
        /*
        
        if array.contains(obj) {
            return true
        } else {
            return false;
        }

        */
    }
    /**
     * EXAMPLE: similar([1, 2, 3, 10, 100],[1, 2, 3, 4, 5, 6])
     * TODO: upgrade to support 
     */
    class func similar(a:Array<Int>,b:Array<Int>)->Array<Int>{
        var similarList:Array<Int> = []
        for x in b {
            for y in a {
                if y == x {
                    similarList.append(y)
                    break
                }
            }
        }
        return similarList
    }
}
import Foundation
/**
 * EXAMPLE: Range(start:2,end:6).count//4
 * TODO: Figure out how to write extensions for Range that also works with RangeAsserter etc
 */
extension Range {
    var start:Element {return self.startIndex}/*convenince*/
    var end:Element {return self.endIndex}/*convenince*/
    var length:Int {return (self.endIndex as! Int) - (self.startIndex as! Int)}/*convenince*/
    /**
     * EXAMPLE: Range<Int>(0,3).numOfIndecies()//4 -> because [0,1,2,3].count// 4
     * NOTE: only works with Range<Int> for now
     */
    var numOfIndecies:Int{ return (self.end as! Int) - (self.start as! Int) + 1 }
    init(_ start:Element,_ end:Element){/*Conveninence initializer*/
        //TODO:  try ->return self.indices.count or self.underestimateCount()
        self.init(start:start,end:end)
    }
}
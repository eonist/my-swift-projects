import Foundation
/**
 * EXAMPLE: Range(start:2,end:6).count//4
 */
extension Range {
    /**
     * EXAMPLE: Range<Int>(0,3).numOfIndecies()//4 -> because [0,1,2,3].count// 4
     * NOTE: only works with Range<Int> for now
     */
    init(_ start:Bound,_ end:Bound){/*Conveninence initializer*/
        //TODO:  try ->return self.indices.count or self.underestimateCount()
        self.init(start..<end/*<-CountableRange<Int>*/)//which->converts to Range<Int>
    }
    var start:Bound {return self.lowerBound}
    var end:Bound {return self.upperBound}
    var length:Int {return (self.upperBound as! Int) - (self.lowerBound as! Int)}/*convenince*/
}
extension CountableRange/* where Bound:Integer */{
    var start:Bound {return self.startIndex}/*convenince*/
    var end:Bound {return self.endIndex}/*convenince*/
    //you can also use the native var: .count instead of the bellow .length
    var length:Int {return (self.endIndex as! Int) - (self.startIndex as! Int)}/*convenince*/
    var numOfIndecies:Int{ return (self.end as! Int) - (self.start as! Int) + 1 }
    var ran:Int {return IntParser.random(self.start as! Int, self.end as! Int)}
}
extension Range where Bound:Comparable {
    func equals(_ range:Range<Bound>)->Bool {/*Convenience*/
        return RangeAsserter.equals(self ,range)
    }
    func within(_ number:Bound)->Bool{/*Convenience*/
        return RangeAsserter.within(self, number)
    }
    func contained(_ number:Bound)->Bool{/*Convenience*/
        return RangeAsserter.contained(self, number)
    }
    func overlaps(_ range:Range<Bound>)->Bool{/*Convenience*/
        return RangeAsserter.overlaps(self, range)
    }
    func contains(_ range:Range<Bound>)->Bool{/*Convenience*/
        return RangeAsserter.contains(self, range)
    }
    func edge(_ index:Bound)->Bool{/*Convenience*/
        return RangeAsserter.edge(index, self)
    }
}

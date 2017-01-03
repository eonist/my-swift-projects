import Foundation
/**
 * EXAMPLE: Range(start:2,end:6).count//4
 */
extension Range {
    var start:Element {get{return self.startIndex}set{self.startIndex = newValue}}/*convenince*/
    /*.last is the same as: .end-1*/
    var end:Element {get{return self.endIndex}set{self.endIndex = newValue}}/*convenince*/
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
extension Range where Element : Comparable {
    func equals(range:Range<Element>)->Bool {/*Convenience*/
        return RangeAsserter.equals(self ,range)
    }
    func within(number:Element)->Bool{/*Convenience*/
        return RangeAsserter.within(self, number)
    }
    func contained(number:Element)->Bool{/*Convenience*/
        return RangeAsserter.contained(self, number)
    }
    func overlaps(range:Range<Element>)->Bool{/*Convenience*/
        return RangeAsserter.overlaps(self, range)
    }
    func contains(range:Range<Element>)->Bool{/*Convenience*/
        return RangeAsserter.contains(self, range)
    }
    func edge(index:Element)->Bool{/*Convenience*/
        return RangeAsserter.edge(index, self)
    }
}

/*
//seems to be native already
public func ==<T: Comparable> (a: Range<T>, b:Range<T>) -> Bool{/*convenience*/
return a.equals(b)
}*/
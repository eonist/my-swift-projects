import Foundation

typealias CGLineAsserter = LineAsserter
/*
 * There is about 20 other lineAssert methods in legacy code
 */
class LineAsserter {
    /**
     *
     */
    class func intersects(a:Line,_ b:Line) -> Bool {// :TODO: rename to isSomeName
        return PointAsserter.intersects(a.p1, a.p2, b.p1, b.p2)
    }
    /**
     *
     */
    class func oppositeDirectional(bisector:CGLine,_ a:CGLine,_ b:CGLine) -> Bool {// :TODO: rename to isSomeName
        return PointAsserter.oppositeDirectional(bisector.p1,bisector.p2,a.p1,a.p2,b.p1,b.p2)
    }
    /**
     *
     */
    class func isContraDirectional(a:CGLine,_ b:CGLine) -> Bool {
        return PointAsserter.isContraDirectional(a.p1,a.p2,b.p1,b.p2)
    }
    /**
     *
     */
    class func isCoDirectional(a:CGLine,_ b:CGLine) -> Bool {
        return PointAsserter.isCoDirectional(a.p1, a.p2, b.p1, b.p2)
    }
}
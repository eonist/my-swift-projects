import Foundation

typealias CGLineAsserter = LineAsserter

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
    class func oppositeDirectional(bisector:Line,a:Line,_ b:Line) -> Bool {// :TODO: rename to isSomeName
        return PointAsserter.oppositeDirectional(bisector.p1,bisector.p2,a.p1,a.p2,b.p1,b.p2);
    }
}

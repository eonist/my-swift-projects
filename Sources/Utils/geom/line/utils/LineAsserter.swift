import Foundation

typealias CGLineAsserter = LineAsserter
/*
 * There is about 20 other lineAssert methods in legacy code
 */
class LineAsserter {
    static func intersects(_ a:Line,_ b:Line) -> Bool {// :TODO: ⚠️️ rename to isSomeName
        return CGPointAsserter.intersects(a.p1, a.p2, b.p1, b.p2)
    }
    static func oppositeDirectional(_ bisector:CGLine,_ a:CGLine,_ b:CGLine) -> Bool {// :TODO: rename to isSomeName
        return CGPointAsserter.oppositeDirectional(bisector.p1,bisector.p2,a.p1,a.p2,b.p1,b.p2)
    }
    static func isContraDirectional(_ a:CGLine,_ b:CGLine) -> Bool {
        return CGPointAsserter.isContraDirectional(a.p1,a.p2,b.p1,b.p2)
    }
    static func isCoDirectional(_ a:CGLine,_ b:CGLine) -> Bool {
        return CGPointAsserter.isCoDirectional(a.p1, a.p2, b.p1, b.p2)
    }
}

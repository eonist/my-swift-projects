import Foundation

typealias IArc = ArcKind
protocol ArcKind {
    var start:CGPoint{get set}
    var xRadii:CGFloat{get set}
    var yRadii:CGFloat{get set}
    var rotation:CGFloat{get set}
    var largeArcFlag:Bool{get set}
    var sweepFlag:Bool{get set}
    var end:CGPoint{get set}
    var center:CGPoint?{get set}
}
extension ArcKind{
    var x:CGFloat {get {return center!.x} set {center!.x = newValue}}/*Convenience*/
    var y:CGFloat {get {return center!.y} set {center!.y = newValue}}/*Convenience*/
    var pathData:[CGFloat] {return BasicArcParser.pathData(self)}
}
private class BasicArcParser{
    /**
     * Returns the the pathData that represents an Arc Instance (sans the start point)
     * NOTE: Arc-path-data-structure: xRadii,yRadii,rotation,largeArcFlag,sweepFlag,end.x,end.y,center.x,center.y
     */
    static func pathData(_ arc:ArcKind)->[CGFloat] {
        return [arc.xRadii,arc.yRadii,arc.rotation,arc.largeArcFlag ? 1:0,arc.sweepFlag ? 1:0,arc.end.x,arc.end.y,arc.center!.x,arc.center!.y]
    }
}

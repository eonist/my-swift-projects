import Foundation

protocol IArc {
    var start:CGPoint{get set}
    var xRadii:CGFloat{get set}
    var yRadii:CGFloat{get set}
    var rotation:CGFloat{get set}
    var largeArcFlag:Bool{get set}
    var sweepFlag:Bool{get set}
    var end:CGPoint{get set}
    var center:CGPoint?{get set}
}
extension IArc{
    var x:CGFloat {get {return center!.x} set {center!.x = newValue}}/*convenience*/
    var y:CGFloat {get {return center!.y} set {center!.y = newValue}}/*convenience*/
    var pathData:Array<CGFloat> {return ArcParser.pathData(self)}
}

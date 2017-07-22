import Foundation

typealias FrameTick = (CGFloat)->Void/*the callBack signature for onFrame ticks*/
extension Animator {
    typealias InitValues = (duration:CGFloat,from:CGFloat,to:CGFloat)/*Signature for initValues*/
    static var initValues:InitValues = (duration:0.5,from:0,to:1)/*Default init values*/
    static var fps:CGFloat = 60//<--TODO: ⚠️️ this should be derived from a device variable
    var duration:CGFloat {get{return initValues.duration}set{initValues.duration = newValue}}/*In seconds*/
    var from:CGFloat {get{return initValues.from}set{initValues.from = newValue}}/*From this value*/
    var to:CGFloat {get{return initValues.to}set{initValues.to = newValue}}/*To this value*/
    var framesToEnd:CGFloat {return Animator.fps * duration}/*totFrameCount*/
}

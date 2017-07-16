import Foundation

class FrameTicker:BaseAnimation {
    var callBack:FrameTick/*the closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    init(_ animatable:Animatable, _ callBack:@escaping FrameTick){
        self.callBack = callBack
        super.init(animatable)
    }
    override func onFrame(){
        callBack(NaN)
    }
}

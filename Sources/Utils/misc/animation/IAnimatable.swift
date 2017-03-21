import Cocoa

protocol IAnimatable:class {/*this could probably be renamed to IAnimatableView*/
    func onFrame()
    var animators:[BaseAnimation]{get set}
    //var drawCalls:Array<()->Void>{get set}
    var displayLink:CVDisplayLink{get}
}

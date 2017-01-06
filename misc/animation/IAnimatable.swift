import Cocoa

protocol IAnimatable:class {/*this should probably be renamed to IAnimatableView*/
    func onFrame()
    var animators:Array<BaseAnimation>{get set}
    //var drawCalls:Array<()->Void>{get set}
    var displayLink: CVDisplayLink{get}
}
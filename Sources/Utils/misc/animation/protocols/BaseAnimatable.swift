import Cocoa

protocol BaseAnimatable {
    var onFrame:()->Void {get}
    var animators:[BaseAnimation]{get set}
    var displayLink:CVDisplayLink{get}
}

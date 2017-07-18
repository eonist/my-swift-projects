import Cocoa

protocol BaseAnimatable {
    var onFrame:()->Void
    var animators:[BaseAnimation]{get set}
    var displayLink:CVDisplayLink{get}
}

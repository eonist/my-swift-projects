import Foundation

protocol BaseAnimatable:class {
    var onFrameTick:()->Void {get set}
}

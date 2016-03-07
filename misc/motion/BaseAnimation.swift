import Foundation

class BaseAnimation {
    func onFrame(){
        fatalError("Must be overwritten in subclass")
    }
}

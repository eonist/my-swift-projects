import Cocoa

class BaseAnimation {
    var view:AnimatableView//ref to where the displayLink recides
    var drawCall:(()->Void)?
    init(_ view:AnimatableView){
        self.view = view
    }
    func onFrame(){
        fatalError("Must be overwritten in subclass")
    }
    /**
     * Start the animation
     */
    func start(){
        Swift.print("\(self)" + " start")
        view.animators.append(self)//add your self to the list of animators that gets the onFrame call
        if(!CVDisplayLinkIsRunning(view.displayLink)){CVDisplayLinkStart(view.displayLink)}//start the displayLink if it isnt already running
        
    }
    /**
     * Stop the animation
     */
    func stop(){
        Swift.print("\(self)" + " stop")
        view.animators.removeAt(view.animators.indexOf(self))
        if(view.animators.count == 0 && CVDisplayLinkIsRunning(view.displayLink)){CVDisplayLinkStop(view.displayLink)}//stops the frame ticker if there is not active running animators
    }
}

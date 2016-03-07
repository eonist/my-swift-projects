import Cocoa

class BaseAnimation {
    var view:AnimatableView//ref to where the displayLink recides
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
        //Swift.print("start")
        if(!CVDisplayLinkIsRunning(view.displayLink)){CVDisplayLinkStart(view.displayLink)}//start the displayLink if it isnt already running
        view.animators.append(self)//add your self to the list of animators that gets the onFrame call
    }
    /**
     * Stop the animation
     */
    func stop(){
        //Swift.print("stop")
        view.animators.removeAt(view.animators.indexOf(self))
        if(view.animators.count == 0 && CVDisplayLinkIsRunning(view.displayLink)){CVDisplayLinkStop(view.displayLink)}//stops the frame ticker if there is not active running animators
    }
}

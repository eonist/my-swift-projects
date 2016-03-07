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
        
        let displayLinkIsRunning = CVDisplayLinkIsRunning(view.displayLink)
        Swift.print("view.animators.count: " + "\(view.animators.count)")
        Swift.print("\(self)" + " start " + "displayLinkIsRunning: " + "\(displayLinkIsRunning)")
        if(displayLinkIsRunning == false){CVDisplayLinkStart(view.displayLink)}//start the displayLink if it isnt already running
        Swift.print("displayLinkIsRunning: " + "\(CVDisplayLinkIsRunning(view.displayLink))")
        view.animators.append(self)//add your self to the list of animators that gets the onFrame call
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

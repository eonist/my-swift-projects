//“ this is what closures look like:”

let aClosure : Void -> Int = { return 1 }

aClosure() // returns 1

//“In Objective-C, closures are known as blocks. For this reason, several methods that belong to Cocoa and Cocoa Touch contain the word block, where you should provide a closure”

// In this code, aViewController and anotherViewController
// are both UIViewControllers.

// Slide up a view controller, and then when the slide animation is
// finished, change its view's background color to yellow.

aViewController.presentViewController(anotherViewController, animated: true) {
    // This closure is run after the animation is finished
    anotherViewController.view.backgroundColor = UIColor.yellowColor()
}

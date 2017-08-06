import Foundation
/**
 * Sometimes DispatchGroup doesn't work when you need nested groups etc. Mixing async and sync code eetc 
 * ThreadGroup is simple in design and can work as a substitute.
 * this is an experiment for now. revisit if needed
 */
/*
 class ThreadGroup {
    typealias CompletionHandler = ()->Void
    var index : Int = 0
    var onComplete:CompletionHandler
    var count:Int = 0//when count reaches this count, onAllComplete is executed
    init(onComplete:@escaping CompletionHandler = {fatalError("must have completion handler attached")}){
        self.onComplete = onComplete
    }
    /**
     * you enter 
     */
    func enter(){
        self.count += 1
    }
    /**
     * Seems to work in both bg and main threads
     */
    func leave(){
        self.index += 1
//            Swift.print("self.index: " + "\(self.index) " + " self.count: " + "\(self.count)")
        if self.index == self.count {
            self.onComplete()
        }
    }
}
*/

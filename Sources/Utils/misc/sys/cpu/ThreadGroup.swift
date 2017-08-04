import Foundation
/**
 * Sometimes DispatchGroup doesn't work when you need nested groups etc. ThreadGroup is simple in design and can work as a substitute. 
 */
class ThreadGroup {
    typealias CompletionHandler = ()->Void
    private var index:Int = 0//currentIndex
    private var allComplete:CompletionHandler
    private var count:Int = 0//when count reaches this count, onAllComplete is executed
    init(onAllComplete:@escaping CompletionHandler = {fatalError("must have completion handler attached")}){
//      self.count = count
        self.allComplete = onAllComplete
    }
    func enter(){
        count += 1
    }
    /**
     * IMPORTANT: onComplete must be called on the main thread
     */
    func leave(){
        index += 1
        if index == count {
            allComplete()
        }
    }
}

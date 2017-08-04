import Foundation
/**
 * Sometimes DispatchGroup doesn't work when you need nested groups etc. Mixing async and sync code eetc 
 * ThreadGroup is simple in design and can work as a substitute.
 * NOTE: private (set) var value : Int32 = 0; OSAtomicIncrement32(&value) could be faster
 */
class ThreadGroup {
    typealias CompletionHandler = ()->Void
    private (set) var index : Int32 = 0
    var onComplete:CompletionHandler
    private var count:Int32 = 0//when count reaches this count, onAllComplete is executed
    init(onComplete:@escaping CompletionHandler = {fatalError("must have completion handler attached")}){
        self.onComplete = onComplete
    }
    /**
     * Seems to work in both bg and main threads
     */
    func enter(){
        OSAtomicIncrement32(&count)/*OSAtom... makes Int threadsafe*/
    }
    /**
     * Seems to work in both bg and main threads
     */
    func leave(que:DispatchQueue = main){
        OSAtomicIncrement32(&index)
        if self.index == self.count {
            self.onComplete()
        }
    }
}

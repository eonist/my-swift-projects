import Foundation
/**
 * Sometimes DispatchGroup doesn't work when you need nested groups etc. ThreadGroup is simple in design and can work as a substitute.
 * NOTE: private (set) var value : Int32 = 0; OSAtomicIncrement32(&value) could be faster
 */
class ThreadGroup {
    typealias CompletionHandler = ()->Void
    private var index:Int = 0//currentIndex
    var onComplete:CompletionHandler
    private var count:Int = 0//when count reaches this count, onAllComplete is executed
    init(onComplete:@escaping CompletionHandler = {fatalError("must have completion handler attached")}){
//      self.count = count
        self.onComplete = onComplete
    }
    func enter(){
        count += 1
    }
    /**
     * IMPORTANT: onComplete must be called on the main thread (It could be that you dont need to use main thread to increment int)
     */
    func leave(que:DispatchQueue = main){
        que.async{
            self.index += 1
            if self.index == self.count {
                self.onComplete()
            }
        }
    }
}

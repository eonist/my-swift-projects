import Foundation

class ThreadGroup {
    typealias CompletionHandler = ()->Void
    private var index:Int = 0//currentIndex
    private var allComplete:CompletionHandler
    private var count:Int//when count reaches this count, onAllComplete is executed
    init(_ count:Int,onAllComplete:@escaping CompletionHandler = {fatalError("must have completion handler attached")}){
        self.count = count
        self.allComplete = onAllComplete
    }
    /**
     * IMPORTANT: onComplete must be called on the main thread
     */
    func onComplete(){
        index += 1
        if index == count {
            allComplete()
        }
    }
}

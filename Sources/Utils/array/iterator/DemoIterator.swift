import Foundation
/**
 * Demonstrates async iterator
 */
class DemoIterator: ArrayIterator<DemoItem> {
    var complete: Completed
    init(array: Array<T>, onComplete:@escaping Completed) {
        self.complete = onComplete
        super.init(array: array)
    }
}
/**
 * Extension
 */
extension DemoIterator {
    typealias Completed = () -> Void
    func iterate(callBack:@escaping (_ item: DemoItem, _ success: Bool) -> Void){
        Swift.print("iterate")
        if hasNext() {
            let item: DemoItem = next()
            DispatchQueue.global(qos: .background).async {
                sleep(2)/*Simulates some remote service taking 2.0 sec*/
                let eitherOr: Bool = arc4random_uniform(2) == 0/*heads or tails*/
                Swift.print("Doing some work 💪, success: \(eitherOr ? "✅" : "🚫")")
                callBack(item, eitherOr)
            }
        } else {
            complete()
        }
    }
}
struct DemoItem{}

/**
 * ## Examples:
 * DemoIteratorExample().iterate() //All done: 🎉 2
 */
class DemoIteratorExample {
    var validItems: [DemoItem] = []
    lazy var arrIterator: DemoIterator = DemoIterator(array: [DemoItem() ,DemoItem(), DemoItem()]) {
        print("All done: 🎉 \(self.validItems.count)")// the result varies between a count of 0 and 3
    }
    func iterate() {
        arrIterator.iterate { item, success in
            if success {
                self.validItems.append(item)
                self.iterate()
            } else {
                self.iterate()
            }
        }
    }
}



class ReverseableDemo{

}

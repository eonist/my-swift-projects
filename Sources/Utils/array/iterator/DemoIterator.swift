import Foundation
/**
 * Demonstrates async iterator
 */
class DemoIterator: ArrayIterator<DemoItem> {
    typealias Completed = () -> Void
    var complete: Completed
    init(array: Array<T>, onComplete:@escaping Completed) {
        self.complete = onComplete
        super.init(array: array)
    }
    func iterate(callBack:@escaping (_ item: DemoItem, _ success: Bool) -> Void){
        if hasNext() {
            let item: DemoItem = next()
            DispatchQueue.global(qos: .background).async {
               sleep(UInt32(Int(2.6)))/*Simulates some remote service taking 2.6sec*/
               let eitherOr: Bool = arc4random_uniform(2) == 0/*heads or tails*/
               callBack(item,eitherOr)
            }
        }else{
            complete()
        }
    }
}
struct DemoItem{}
/**
 * Example use:
 */
var validItems: [DemoItem] = []
var arrIterator: DemoIterator = DemoIterator(array: [DemoItem() ,DemoItem(), DemoItem()]){
   print("All done: \(validItems.count)")//between 0 and 3
}
func iterate(){
    arrIterator.iterate{ item, success in
        if success {
            validItems.append(item)
        } else {
            iterate()
        }
    }
}
//iterate()

class ReverseableDemo{

}

/**
 * Demonstrates async iterator
 */
class DemoIterator:ArrayIterator<DemoItem> {
    var complete:()->Void
    init(array: Array<T>,onComplete:@escaping Completed) {
        self.complete = onComplete
        super.init(array: array)
    }
    func iterate(callBack:(item:DemoItem, success:Bool)->Void){
        if hasNext() {
            let item:DemoItem = next()
            DispatchQueue.global(qos: .background).async {
               sleep(2.6)/*Simulates some remote service taking 2.6sec*/
               let eitherOr:Bool = arc4random_uniform(2) == 0/*heads or tails*/
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
var arrIterator = ArrayIterator(array:[DemoItem(),DemoItem(),DemoItem()]){
   print("All done: \(validItems.count)")
}
var validItems:[]
arrIterator.iterate{ item,success in
   if success {
      validItems.append(item)
   } else {
      iterate()
   }
}
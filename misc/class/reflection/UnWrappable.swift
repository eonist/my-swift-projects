import Foundation
//Continue here: what you do is that you extend the Types you want to unWrap.
//And use inference similar to the way you made that cast method.
//For more complex types see if they them selfs are UnWrappable. NICE!
protocol UnWrappable {
    //use init instead
    func unWrap<T>(xml:XML) -> T?
    
}

extension UnWrappable{
    
    func unWrap<T>(xml:XML,_ key:String) -> T?{
        
        return nil
    }
   
}

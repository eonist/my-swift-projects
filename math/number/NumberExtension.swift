import Foundation


extension NumberType{
 
    //func clip(_ min:NumberType,_ max:NumberType)->NumberType{return NumberParser.clip(self, min, max)}/*Convenince*/
}

func before<T:Comparable>(a: T, b: T) -> T {
    return a + b
}

protocol NumberType:Comparable{
   
}
extension CGFloat:NumberType{
    
}
extension Int:NumberType{
    
}

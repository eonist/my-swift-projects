import Foundation


extension NumberType{
 
    //func clip(_ min:NumberType,_ max:NumberType)->NumberType{return NumberParser.clip(self, min, max)}/*Convenince*/
}

func == (lhs: NumberType, rhs: NumberType) -> Bool {
    
    return false
}
func < (lhs: NumberType, rhs: NumberType) -> Bool {
    
    return true
}
protocol NumberType:Comparable{
   
}
extension CGFloat:NumberType{
    
}
extension Int:NumberType{
    
}

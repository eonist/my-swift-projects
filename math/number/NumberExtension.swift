import Foundation


extension NumberType{
    static func <(lhs: NumberType, rhs: NumberType) -> Bool {
        return true
    }
    
    // MARK: Equatable
    
    static func ==(lhs: NumberType, rhs: NumberType) -> Bool {
        return false
    }
    //func clip(_ min:NumberType,_ max:NumberType)->NumberType{return NumberParser.clip(self, min, max)}/*Convenince*/
}

protocol NumberType:Comparable{
   
}
extension CGFloat:NumberType{
    
}
extension Int:NumberType{
    
}

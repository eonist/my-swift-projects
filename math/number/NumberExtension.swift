import Foundation

extension Comparable{
    <
}

extension NumberType{
    func clip(_ min:NumberType,_ max:NumberType)->NumberType{return NumberParser.clip(self, min, max)}/*Convenince*/
}

protocol NumberType{
    
}
extension CGFloat:NumberType{
    
}
extension Int:NumberType{
    
}

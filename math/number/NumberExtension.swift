import Foundation

extension Comparable{
    func clip(_ min:T,_ max:T)->T{return NumberParser.clip(self, min, max)}/*Convenince*/
}

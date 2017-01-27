import Foundation

extension Comparable{
    func clip(_ min:Comparable,_ max:Comparable)->Comparable{return NumberParser.clip(self, min, max)}/*Convenince*/
}

import Foundation

extension CGFloat {
    func toFixed(places:Int)->CGFloat{
        return NumberModifier.toFixed(self, places)
    }
}
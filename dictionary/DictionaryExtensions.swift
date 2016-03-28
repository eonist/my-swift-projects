import Foundation

extension Dictionary {
    func combine<K,V>(b:Dictionary<K,V>)->Dictionary<K,V>{//// :TODO: rename to combine since merge implies that the passed obj is also changed
        return DictionaryModifier.combine(self, b)
    }
}

import Foundation
//Continue here: what you do is that you extend the Types you want to unWrap.
//And use inference similar to the way you made that cast method.
//For more complex types see if they them selfs are UnWrappable. NICE!
protocol UnWrappable {
    //use init instead
    func unWrap<T>(xml:XML,_ key:String) -> T?
}
extension UnWrappable{
    /**
     * NOTE: looks at the type and converts that the value into a type
     */
    func unWrap<T>(xml:XML,_ key:String) -> T?{
        if(xml.childCount == 0 || xml.value.count == 0){//return nil if the node has no value and no subNodes
            return nil
        }
        let type:String = xml["type"]!
        let value:String = xml.value
        switch(true) {
        case type == "String":return value as? T
        case type == "CGFloat":return value.cgFloat as? T
        case type == "Double":return value.double as? T
        case type == "Int":return value.int as? T
        case type == "UInt":return value.uint as? T
        case type == "Bool":return value.bool as? T
        case type == "DropShadow":return value as? T
        default : fatalError("TYPE NOT SUPPORTED: " + "\(type)" + " value: " + "\(value)")
        }
    }
}

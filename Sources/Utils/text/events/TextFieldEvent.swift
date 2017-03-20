import Foundation

class TextFieldEvent:Event{}
extension TextFieldEvent{
    var stringValue:String {return (origin as! TextField).stringValue}
}
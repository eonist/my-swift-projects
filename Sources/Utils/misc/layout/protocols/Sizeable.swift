import Foundation
/**
 * TODO: Rename to Sizable
 */
protocol Sizable:class {//<--new extends class, so that it can be casted correctly without becomming a copy
    var size:CGSize {get set}//replace with getSizeValue or alike, see IPositional
    func setSizeValue(_ size:CGSize)
}
/**
 * CAUTION: These extensions can only be used if you dont need to cast the instance to ISizeable
 */
extension Sizable{
    var width:CGFloat{
        get{
            if self.size.width.isNaN {fatalError("width can't be NaN self.parents: \(NSViewParser.parents((self as! RectGraphic).graphic))")}
            return self.size.width
        }set{
            if newValue.isNaN {fatalError("width can't be NaN")}
            self.size.width = newValue
        }
    }
    var height:CGFloat{
        get{
            if self.size.height.isNaN {fatalError("height can't be NaN")}
            return self.size.height
        }set{
            if newValue.isNaN {fatalError("height can't be NaN")}
            self.size.height = newValue
        }
    }
}

import Foundation

protocol ISizeable:class {//<--new extends class
    var size:CGSize {get set}
    func setSizeValue(size:CGSize)
    //func setSize(width:CGFloat,height:CGFloat)//unsure if this can be here when you have that same method in the extension
}
/**
 * CAUTION: These extensions can only be used if you dont need to cast the instance to ISizeable
 */
extension ISizeable{
    //var sizeable:ISizeable {get{return self as ISizeable}set{}}/*This method provides support for returning a direct pointer when casting to protocol, which swift doesnt do, it only provides an immutable reference, which is unusable when setting mutating variables via extensions*/
    var width:CGFloat{
        get{
            if(self.size.width.isNaN){ fatalError("width can't be NaN")}
            if(self.size.width.isNaN){fatalError("height can't be NaN")}
            return self.size.width
        } set{
            self.width = newValue
        }
    }
    var height:CGFloat{get{return self.size.height} set{self.height = newValue}}
    /*mutating func setSize(width:CGFloat,height:CGFloat){
    self.width = width
    self.height = height
    }*/
    /*mutating func setSize(size:CGSize){
    self.width = size.width
    self.height = size.height
    }*/
}
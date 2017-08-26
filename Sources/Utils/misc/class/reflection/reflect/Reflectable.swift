import Cocoa
/**
 * NOTE: For special types like CGAffineTransform etc, you should make an protocol named: Reflectable that you extend CGColor CGTransform etc. that package these types into an organized xml child
 */
protocol Reflectable {
    var reflection:(type:String,value:String) {get}
}
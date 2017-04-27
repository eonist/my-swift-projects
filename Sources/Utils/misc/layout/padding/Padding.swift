import Foundation
/**
 * TopRightBottomLeft (TRBL aka Trouble)
 * TODO: ⚠️️ Use Generics for these Margin, Fillet,Padding classes
 */
struct Padding {
    var top:CGFloat = 0
    var right:CGFloat = 0
    var bottom:CGFloat = 0
    var left:CGFloat = 0
    init(_ args:Any...){
        switch(args.count){
            case 1: left = args[0] as! CGFloat; right = args[0] as! CGFloat; top = args[0] as! CGFloat; bottom = args[0] as! CGFloat; break;
            case 2: top = args[0] as! CGFloat; bottom = args[0] as! CGFloat;left = args[1] as! CGFloat; right = args[1] as! CGFloat; break;
            case 3: top = args[0] as! CGFloat; left = args[1] as! CGFloat; right = args[1] as! CGFloat; bottom = args[2] as! CGFloat;break;
            case 4: top = args[0] as! CGFloat; right = args[1] as! CGFloat; bottom = args[2] as! CGFloat; left = args[3] as! CGFloat; break;
            default:break;
        }
    }
    /**
     * TODO: Could this be added through an extension? seems like not!
     */
    init(_ args:[CGFloat]){
        switch(args.count){
            case 1: left = args[0]; right = args[0]; top = args[0]; bottom = args[0]; break;
            case 2: top = args[0]; bottom = args[0];left = args[1]; right = args[1]; break;
            case 3: top = args[0]; left = args[1]; right = args[1]; bottom = args[2]; break;
            case 4: top = args[0]; right = args[1]; bottom = args[2]; left = args[3]; break;
            default:break;
        }
    }
}
extension Padding{
    var hor:CGFloat {return left + right}
    var ver:CGFloat {return top + bottom}
}

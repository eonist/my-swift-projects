import Foundation

class Margin:ILayout{
    var top:CGFloat = 0;
    var right:CGFloat = 0;
    var bottom:CGFloat = 0;
    var left:CGFloat = 0;
    required init(_ args:Any...){
        switch(args.count){
        case 0: left = args[0] as! CGFloat; right = args[0] as! CGFloat; top = args[0] as! CGFloat; bottom = args[0] as! CGFloat
        case 1: left = args[0] as! CGFloat; right = args[0] as! CGFloat; top = args[0] as! CGFloat; bottom = args[0] as! CGFloat;
        case 2: left = args[0] as! CGFloat; right = args[0] as! CGFloat;top = args[1] as! CGFloat; bottom = args[1] as! CGFloat;
        case 3: left = args[0] as! CGFloat;right = args[1] as! CGFloat;top = args[2] as! CGFloat;bottom = OffsetType.center;
        default: left = args[0] as! CGFloat;right = args[1] as! CGFloat;top = args[2] as! CGFloat;bottom = args[3] as! CGFloat; /*length >= 4*/
        }
    }
}

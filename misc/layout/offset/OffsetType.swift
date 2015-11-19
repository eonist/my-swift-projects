import Foundation
/*
* // :TODO: redesign this class like TRBL
*/
class OffsetType:ILayout{
    static var center:String = "center";// :TODO: move this to a class called OffsetType
    static var outside:String = "outside";
    static var inside:String = "inside";
    var left:String
    var right:String
    var top:String
    var bottom:String
    required init(_ params:Any...){
        let args:Array<String> = params as! Array<String>
        switch(args.count){
            case 0: left = OffsetType.center; right = OffsetType.center; top = OffsetType.center; bottom = OffsetType.center
            case 1: left = args[0]; right = args[0]; top = args[0]; bottom = args[0];
            case 2: left = args[0]; right = args[0];top = args[1]; bottom = args[1];
            case 3: left = args[0];right = args[1];top = args[2];bottom = OffsetType.center;
            default: left = args[0];right = args[1];top = args[2];bottom = args[3]; /*length >= 4*/
        }
    }
}
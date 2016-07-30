import Foundation

protocol IPath:class {
    var commands:Array<Int>{get set}
    var pathData:Array<CGFloat>{get set}
    var rotation:CGFloat{get set}
    var name:String{get set}
}
import Foundation

protocol IPath {
    var commands:Array<Int>{get set}
    var pathData:Array<CGFloat>{get set}
    var rot:CGFloat{get set}
    var name:String{get set}
}
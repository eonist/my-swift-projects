import Foundation

protocol IPath:class{/*<-when you extend class you can mutate variables directly when casting to IPath*/
    var commands:Array<Int>{get set}
    var pathData:Array<CGFloat>{get set}
    var rotation:CGFloat{get set}
    var name:String{get set}
}
import Foundation

protocol IPath:class{/*<-When you extend class you can mutate variables directly when casting to IPath, why because scruts don't allow this and so on..*/
    var commands:[Int]{get set}
    var pathData:[CGFloat]{get set}
    var rotation:CGFloat{get set}
    var name:String{get set}
}

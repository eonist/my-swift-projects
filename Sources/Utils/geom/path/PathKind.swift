import Foundation
/**
 * TODO: Consider renaming IPath to PathDrawable or PathKind, more intune with the swift naming convention
 */
//typealias PathKind = PathKind
protocol PathKind{/*<-When you extend class you can mutate variables directly when casting to IPath, why because scruts don't allow this and so on..*/
    var commands:[Int]{get set}
    var pathData:[CGFloat]{get set}
    var rotation:CGFloat{get set}
    var name:String{get set}
}

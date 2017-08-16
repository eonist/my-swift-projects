import Foundation
struct Path:PathKind {
    var commands:[Int]// :TODO: does this need to be created? isnt it passed through argument
    var pathData:[CGFloat]// :TODO: does this need to be created? isnt it passed through argument
    var rotation:CGFloat/*in degrees*/// :TODO: is this much used?// :TODO: if we can have roation why cant we have matrix?
    var name:String = ""/*temp*/// :TODO: why is this temp? because it probably needs to be moved to DisplayPath etc
    init(_ commands:[Int] = [Int](),_ pathData:[CGFloat] = [CGFloat](),_ rotation:CGFloat = 0) {
        self.commands = commands
        self.pathData = pathData
        self.rotation = rotation
    }
}

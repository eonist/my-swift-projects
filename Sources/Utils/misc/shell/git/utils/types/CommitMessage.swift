import Foundation

struct CommitMessage{
    var title:String
    var description:String
    init(_ title:String,_ desc:String){
        self.title = title
        self.description = desc
    }
}
extension CommitMessage{
    static var dummyData:CommitMessage {
        return CommitMessage("Fixed bug","Lots of bugs")
    }
}

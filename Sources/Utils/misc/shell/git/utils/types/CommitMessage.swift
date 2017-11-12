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
    func describe(){
        Swift.print("CommitMessage.title: " + "\(title)")
        Swift.print("CommitMessage.description: " + "\(description)")
    }
}

import Foundation

typealias GitKey = (user:String,  pass:String)
//typealias GitRepo = (localPath:String,  remotePath:String,  branch:String)
//typealias GitMsg = (title:String,  desc:String)

class GitTypes{
    /**
     * Describe
     */
    static func describe(_ repo:GitRepo,_ key:GitKey){
        Swift.print("(" + "localPath: \(repo.localPath) , remotePath:  \(repo.remotePath), user: \(key.user), pass: \(key.pass), branch:  \(repo.branch) )")
    }
}

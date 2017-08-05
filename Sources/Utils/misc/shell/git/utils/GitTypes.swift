import Foundation


struct GitRepo{
    var localPath:String,  remotePath:String, branch:String
    init(_ localPath:String,_ remotePath:String,_ branch:String){self.localPath = localPath;self.remotePath = remotePath;self.branch = branch;}
}

class GitTypes{
    /**
     * Describe
     */
    static func describe(_ repo:GitRepo,_ key:GitKey){
        Swift.print("(" + "localPath: \(repo.localPath) , remotePath:  \(repo.remotePath), user: \(key.user), pass: \(key.pass), branch:  \(repo.branch) )")
    }
}

import Foundation

struct GitRepo{
    var localPath:String, remotePath:String, branch:String
    init(_ localPath:String,_ remotePath:String,_ branch:String){
        self.localPath = localPath;
        self.remotePath = remotePath;
        self.branch = branch;
    }
}

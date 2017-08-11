import Foundation

struct GitRepo{
    var localPath:String, remotePath:String, branch:String
    init(_ localPath:String,_ remotePath:String,_ branch:String){
        self.localPath = localPath;
        self.remotePath = remotePath;
        self.branch = branch;
    }
}
extension GitRepo{
    /**
     * New
     * PARAM: remotePath: https://github.com/john/demo.git
     * PARAM: localPath: Users/John/dev/demo
     */
    static func gitRepo(localPath:String, remotePath:String, branch:String)-> GitRepo {
        let remotePath:String = {
            if self.remote.test("^https://.+$") {
                return self.remote.subString(8, self.remote.count)}/*support for partial and full url,strip away the https://, since this will be added later*/
            else {
                return self.remote
            }
        }()
        return GitRepo(self.local, remotePath, self.branch)
    }//temp
}

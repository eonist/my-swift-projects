import Foundation
/**
 * PARAM: remotePath: github.com/john/demo.git
 * PARAM: localPath: Users/John/dev/demo
 * PARAM: master
 */
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
     * Creates a GitRepo instance by removing the https:// from the remotePath
     * PARAM: remotePath: https://github.com/john/demo.git
     * PARAM: localPath: Users/John/dev/demo
     */
    static func gitRepo(_ localPath:String, _ remotePath:String, _ branch:String)-> GitRepo {
        let remotePath:String = {
            if remotePath.test("^https://.+$") {
                return remotePath.subString(8, remotePath.count)}/*support for partial and full url,strip away the https://, since this will be added later*/
            else {
                return remotePath
            }
        }()
        return GitRepo(localPath, remotePath, branch)
    }
}

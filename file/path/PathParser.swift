import Foundation
class PathParser {
    /**
     * Returns the path to where you can save your app's files. Here it is:
     */
    class func docPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
}
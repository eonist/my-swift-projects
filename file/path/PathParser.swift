import Foundation
class PathParser {
    /**
     * Returns the path to where you can save your app's files. Here it is:
     */
    class func appDocPath()->String{
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths[0]
    }
    /**
     *
     */
    class func path(stringPath:String)->NSURL{
        let url = NSURL(string: stringPath)
        return url!
    }
}
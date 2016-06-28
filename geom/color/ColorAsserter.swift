import Foundation

class ColorAsserter {
    /**
     * @param string ("both 0x00ff00" and "0x00f" will return true)
     */
    class func isColor(string:String)->Bool {
        return RegExp.test(string, "^0x?([a-fA-F0-9]{3}){1,2}$")
    }
}
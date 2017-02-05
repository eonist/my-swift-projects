import Cocoa

class WinAsserter {
    /**
     * Asserts if a win of PARAM: type exists
     */
    static func hasWindowOfType<T>(_ type:T.Type) -> Bool{
        return WinParser.windowsOfType(type).count > 0
    }
}

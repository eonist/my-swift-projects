import Cocoa

class WinAsserter {
    /**
     *
     */
    class func windowOfTypeExists() -> Bool{
        return WinParser.windowsOfType(PositionWin).count > 0
    }
}

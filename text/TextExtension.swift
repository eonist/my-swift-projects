import Cocoa

class TextField:NSText{
    override init(frame frameRect: NSRect) {
        Swift.print("TextField.init()")
        super.init(frame: frameRect)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

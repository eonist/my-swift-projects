#if os(OSX)
    import AppKit.NSView
    public typealias ViewType = NSView
#else
    import UIKit.UIView
    public typealias ViewType = UIView
#endif


open class View: ViewType {}//adds cross-platformness

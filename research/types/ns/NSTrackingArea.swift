//import AppKit

struct NSTrackingAreaOptions : OptionSetType {
    init(rawValue rawValue: UInt)
    static var MouseEnteredAndExited: NSTrackingAreaOptions { get }
    static var MouseMoved: NSTrackingAreaOptions { get }
    static var CursorUpdate: NSTrackingAreaOptions { get }
    static var ActiveWhenFirstResponder: NSTrackingAreaOptions { get }
    static var ActiveInKeyWindow: NSTrackingAreaOptions { get }
    static var ActiveInActiveApp: NSTrackingAreaOptions { get }
    static var ActiveAlways: NSTrackingAreaOptions { get }
    static var AssumeInside: NSTrackingAreaOptions { get }
    static var InVisibleRect: NSTrackingAreaOptions { get }
    static var EnabledDuringMouseDrag: NSTrackingAreaOptions { get }
}
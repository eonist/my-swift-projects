import Cocoa
/**
 * You can resize a window by doing: win.setContentSize(CGSize(100,100))
 */
class WinModifier {
    /**
     * Positions a window to PARAM: position
     * CAUTION: the coordinate space of the y is flipped, so you have to substract the screen height etc before passing the position point
     */
    static func position(_ win:NSWindow, _ position:CGPoint){
        win.setFrameOrigin(position)
        //win.setFrame(NSRect(position.x,position.y,win.frame.width,win.frame.height), display: true)/*<--unsure what the display var does*/
    }
    /**
     * Aligns a window to an alignment type
     * IMPORTANT: The screen aligns from the bottom up (so use bottom for top and top for bottom) (you could fix this, it probably only requires a minus sign herer and there)
     */
    static func align(_ win:NSWindow,_ canvasAlignment:String,_ viewAlignment:String,_ offset:CGPoint = CGPoint(0,0)) {
        let alignmentPoint:CGPoint = alignPoint(win.frame.size,canvasAlignment,viewAlignment,offset)
        WinModifier.position(win, alignmentPoint)
    }
    /**
     * NOTE: This method is great when you want to find the correct alignment for an NSWindow before is initiated
     */
    static func alignPoint(_ winSize:CGSize,_ canvasAlignment:String,_ viewAlignment:String,_ offset:CGPoint = CGPoint(0,0))->CGPoint{
        return Align.alignmentPoint(CGSize(winSize.width,winSize.height), CGSize(NSScreen.main!.visibleFrame.width,NSScreen.main!.visibleFrame.height),canvasAlignment,viewAlignment,offset)
    }
}

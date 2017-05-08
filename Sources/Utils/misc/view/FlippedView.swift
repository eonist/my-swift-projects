import Cocoa
import Foundation

class FlippedView:NSView{
    override var isFlipped:Bool {return true}/*Organizes your view from top to bottom*/
}

/*protocol IView:class{/*the :class enables you to set variables via extension etc*/
 var layer:CALayer?{get}//TODO:remove?
 var bounds:NSRect{get}
 var frame:NSRect{get set}
 func addSubview(_ aView: NSView)
 }*/

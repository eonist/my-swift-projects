import Cocoa

class ViewModifier {
    /**
     *
     */
    class func applyColor(view:NSView,_ nsFillColor:NSColor = NSColor.clearColor(),_ nsLineColor:NSColor = NSColor.clearColor(),_ lineWidth:Int = 0){
        let cgFillColor = NSColorParser.cgColor(nsFillColor)
        if(nsFillColor != NSColor.clearColor()){/*clearColor: 0.0 white, 0.0 alpha */
            //Swift.print("fill")
            view.layer!.backgroundColor = cgFillColor
            
        }
        let cgLineColor = NSColorParser.cgColor(nsLineColor)
        //Swift.print(nsLineColor)
        if(nsLineColor != NSColor.clearColor()){/*clearColor: 0.0 white, 0.0 alpha */
            //Swift.print("line")
            view.layer!.borderColor = cgLineColor
            view.layer!.borderWidth = CGFloat(lineWidth)
        }
    }
}
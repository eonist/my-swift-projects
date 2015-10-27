import Cocoa

class FillStyle {
    var color:NSColor
    /**
    *
    */
    init(color:NSColor){
        self.color = color
    }
}
protocol IGraphicsFill {
    var color: NSColor { get set }
}

protocol IGraphicsStroke {
    
}
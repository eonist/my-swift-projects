import Foundation

public class GraphicStyle {
    //var fill:IGraphicsFill;
    //var stroke:IGraphicsStroke;
    init(_ fill:IGraphicsFill,_ stroke:IGraphicsStroke) {
        self.fill = fill;
        self.stroke = stroke;
    }
    public var fill: IGraphicsFill {
        get {
            return self.fill
        }
        set {
            
        }
    }
    public var stroke: IGraphicsStroke {
        get {
            return self.stroke
        }
        set {
            self.stroke = newValue
        }
    }
}
public class IGraphicsFill {
    
}
public class IGraphicsStroke {
    
}
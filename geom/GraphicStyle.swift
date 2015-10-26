import Foundation

public class GraphicStyle {
    private var fill:IGraphicsFill;
    private var stroke:IGraphicsStroke;
    init(_ fill:IGraphicsFill,_ stroke:IGraphicsStroke) {
        self.fill = fill;
        self.stroke = stroke;
    }
    public var fill: IGraphicsFill {
        get {
            return self.fill
        }
        set {
            self.fill = newValue
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
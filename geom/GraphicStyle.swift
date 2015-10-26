import Foundation

public class GraphicStyle {
    public var fill: IGraphicsFill { get {return self.fill} set {self.fill = newValue} }
    public var stroke: IGraphicsStroke { get {return self.stroke } set {self.stroke = newValue}}
    init(_ fill:IGraphicsFill,_ stroke:IGraphicsStroke) {
        self.fill = fill;
        self.stroke = stroke;
    }
}
public class IGraphicsFill {
    
}
public class IGraphicsStroke {
    
}
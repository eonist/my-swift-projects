import Cocoa

class NSBezierPathParser {
    /**
    * untest
    */
    class func cgPath(nsBezierPath:NSBezierPath)->CGPath?{
        if nsBezierPath.elementCount == 0 {
            return nil
        }
        
        let path = CGPathCreateMutable()
        var didClosePath = false
        
        for i in 0...nsBezierPath.elementCount-1 {
            var points = [NSPoint](count: 3, repeatedValue: NSZeroPoint)
            
            switch nsBezierPath.elementAtIndex(i, associatedPoints: &points) {
            case .MoveToBezierPathElement:CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
            case .LineToBezierPathElement:CGPathAddLineToPoint(path, nil, points[0].x, points[0].y)
            case .CurveToBezierPathElement:CGPathAddCurveToPoint(path, nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
            case .ClosePathBezierPathElement:CGPathCloseSubpath(path)
            didClosePath = true;
            }
        }
        
        if !didClosePath {
            CGPathCloseSubpath(path)
        }
        
        return CGPathCreateCopy(path)
    }
    /**
    * untest
    */
    class func cgPathOld(nsBezierPath:NSBezierPath)->CGPathRef{
        
        // Create path
        let path = CGPathCreateMutable()
        let points = UnsafeMutablePointer<NSPoint>.alloc(3)
        let numElements = nsBezierPath.elementCount
        
        if numElements > 0 {
            
            var didClosePath = true
            
            for index in 0..<numElements {
                
                let pathType = nsBezierPath.elementAtIndex(index, associatedPoints: points)
                
                switch pathType {
                    
                case .MoveToBezierPathElement:
                    CGPathMoveToPoint(path, nil, points[0].x, points[0].y)
                case .LineToBezierPathElement:
                    CGPathAddLineToPoint(path, nil, points[0].x, points[0].y)
                    didClosePath = false
                case .CurveToBezierPathElement:
                    CGPathAddCurveToPoint(path, nil, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y)
                    didClosePath = false
                case .ClosePathBezierPathElement:
                    CGPathCloseSubpath(path)
                    didClosePath = true
                }
            }
            
            if !didClosePath { CGPathCloseSubpath(path) }
        }
        
        points.dealloc(3)
        return path

    }
}


func toCGPath () -> CGPath? {
    
}
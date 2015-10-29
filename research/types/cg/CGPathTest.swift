//getting bounds of a path:
/*
CGPathGetBoundingBox(self.path);
*/

/*

needs work

let nsBezierPath:NSBezierPath = NSBezierPath()
        let pathPtr = UnsafeMutablePointer<NSBezierPath>.alloc(1)
        pathPtr.initialize(nsBezierPath)
        
        let infoPtr = UnsafeMutablePointer<Void>(pathPtr)
        
        // I hope the CGPathApply call manages the deallocation of the pointers passed to the applier
        // function, but I'm not sure.
        CGPathApply(path, infoPtr) { (infoPtr, elementPtr) -> Void in
            let path = UnsafeMutablePointer<NSBezierPath>(infoPtr).memory
            let element = elementPtr.memory
            
            let pointsPtr = element.points
            
            switch element.type {
            case .MoveToPoint:
                path.moveToPoint(pointsPtr.memory)
                
            case .AddLineToPoint:
                path.lineToPoint(pointsPtr.memory)
                
            case .AddQuadCurveToPoint:
                let firstPoint = pointsPtr.memory
                let secondPoint = pointsPtr.successor().memory
                
                let currentPoint = path.currentPoint
                let x = (currentPoint.x + 2 * firstPoint.x) / 3
                let y = (currentPoint.y + 2 * firstPoint.y) / 3
                let interpolatedPoint = CGPoint(x: x, y: y)
                
                let endPoint = secondPoint
                
                path.curveToPoint(endPoint, controlPoint1: interpolatedPoint, controlPoint2: interpolatedPoint)
                
            case .AddCurveToPoint:
                let firstPoint = pointsPtr.memory
                let secondPoint = pointsPtr.successor().memory
                let thirdPoint = pointsPtr.successor().successor().memory
                
                path.curveToPoint(thirdPoint, controlPoint1: firstPoint, controlPoint2: secondPoint)
                
            case .CloseSubpath:
                path.closePath()
            }
            
            pointsPtr.destroy()
        }

*/
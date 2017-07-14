import Foundation

class PolyLineGraphicUtils{
    /**
     * NOTE: Rename to pathByPoints?, 🚫 as swift supports method overloading, you don't need that specific naming
     */
    static func path(_ points:[CGPoint]) -> IPath {
        return (1..<points.count).indices.reduce(Path([PathCommand.moveTo.rawValue],[points[0].x,points[0].y])) { path,i in
            var path = path
            path.commands.append(PathCommand.lineTo.rawValue)
            let p:CGPoint = points[i]
            path.pathData += [p.x,p.y]
            return path
        }
    }
}


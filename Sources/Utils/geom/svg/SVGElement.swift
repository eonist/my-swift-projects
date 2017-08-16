import Foundation
/**
 * SVGElement serves as a building block for other SVG items and only has an id value
 */
struct SVGElement:SVGElementKind{
    var id:String
    init(_ id:String) {
        self.id = id
    }
}

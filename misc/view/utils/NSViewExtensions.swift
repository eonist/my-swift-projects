import Foundation

extension View {
    /**
     *
     */
    func hitTestPoint(mousePos:NSPoint)->Bool{
        return NSPointInRect(mousePos, frame)
    }
}

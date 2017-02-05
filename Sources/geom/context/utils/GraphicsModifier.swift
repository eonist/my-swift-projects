import Foundation

class GraphicsModifier {
    /**
     * Finalizes the fill style to the path
     * NOTE: before it was all bundeled together in the size method, now its move here
     */
    static func stylize(_ path:CGPath, _ graphics:Graphics){
        graphics.draw(path)/*draw everything*/
        graphics.stopFill()
    }
    /**
     * Finalizes the stroke style to the path
     * NOTE: before it was all bundeled together in the size method, now its move here
     */
    static func stylizeLine(_ path:CGPath, _ graphics:Graphics){
        graphics.draw(path)//draw everything
        graphics.stopStroke()
    }
}

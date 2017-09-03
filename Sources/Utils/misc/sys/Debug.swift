import Foundation

/**
 * EXAMPLE: debug("something",something)
 */
func debug(_ title:String,_ bool:Bool){
    Swift.print("\(title): " + "\(bool ? "✅" : "🚫")")
}

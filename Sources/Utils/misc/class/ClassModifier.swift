import Foundation


/**
 Convenience function for initializing an object and modifying it's properties
 - PARAMETERS:
     - item: the init closure
     - update: trailing closure that gives you access to the object instance
     - RETURNS:
     - Void and optionally throws if there is a try call in the trailing closure?!?
 - EXAMPLE:
     ```
     let rectangle = with(CGRect.init(x: 0, y: 0, width: 100, height: 100)) {
        $0 = $0.offsetBy(dx: 20, dy: 20)
        $0 = $0.insetBy(dx: 10, dy: 10)
     }
     Swift.print(rectangle)// X:30.0, y:30.0, width:80.0, height:80.0
     ```
 - EXAMPLE:
     ```
     let color = with(UIColor.init(red: 50, green: 100, blue: 0, alpha: 0.9)) { ( col:inout UIColor) -> Void  in
        col = col.withAlphaComponent(0.2)
     }
     Swift.print(color.cgColor.alpha)//0.2
     ```
 */
@discardableResult/*👈 Avoids xcode compiler warnings if result is not used*/
func with<T>(_ item: T, update: (inout T) throws -> Void) rethrows -> T {
    var item = item
    try update(&item)
    return item
}

import Foundation

class Point {
    var x:Double
    var y:Double
    init(x:Double = 0, y:Double = 0){
        self.x = x
        self.y = y
    }
}
extension Point{
    var z : String { get { return "YinA"; } }
    /**
     *
     */
    func add(p:Point){
        x += p.x
        y += p.y
    }
    func subtract(p:Point){
        x -= p.x
        y -= p.y
    }
}

extension Point
{
    // THESE OVERIDES DO COMPILE:
    override var  z : String { get { return "YinB"; } }
    
    
    // THESE OVERIDES DO NOT COMPILE:
    //override func h(val: NotSubbed, test: Bool = false) { }
    //override func j(val: SomeEnum) { }
    //override func k(val: SubNSObject, inout test: Bool) { }
    
}
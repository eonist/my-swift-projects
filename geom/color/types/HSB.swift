import Foundation

class HSB {
    private var h : UInt;/*0-360*/
    private var s : UInt;/*0-1*/
    private var b : UInt;/*0-1*/
    init(h:UInt = 0,_ s:UInt = 0,_ b:UInt = 0) {
        self.h = h;
        self.s = s;
        self.b = b;
    }
}

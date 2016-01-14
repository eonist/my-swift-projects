import Foundation

public class Gradient2:IGradient2 {/*<---its public so that it works in playground*/
    public var colors:Array<CGColor>
    public var locations:Array<CGFloat>/*same as color stops*/
    public var transformation:CGAffineTransform?
}

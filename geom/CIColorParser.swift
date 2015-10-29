import Foundation
import Cocoa

class CIColorParser {
    /**
    *
    */
    class func cgColor(ciColor:CIColor)->CGColor{
        let colorSpace:CGColorSpaceRef = ciColor.colorSpace
        let components/*:CGFloat*/ = ciColor.components;
        let cgColor:CGColorRef  = CGColorCreate(colorSpace, components)!;
        return cgColor
    }
}
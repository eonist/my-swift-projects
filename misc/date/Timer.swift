import CoreFoundation
import CoreGraphics
import Darwin
import Foundation

class Timer:NSTimer {
    init(_ timeInterval:NSTimeInterval,_ target:AnyObject,_ aSelector:Selector,_ userInfo:AnyObject?,_ repeats:Bool ){
        super.init(timeInterval: timeInterval, target: target, selector: aSelector, userInfo: userInfo, repeats: repeats)
    }
}

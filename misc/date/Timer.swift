import Foundation

class Timer:NSTimer {
    init(_ timeInterval:NSTimeInterval,_ target:AnyObject,_ selector:Selector,_ userInfo:AnyObject?,_ repeats:Bool ){
        super.init(timeInterval: timeInterval, target: target, selector: selector, userInfo: userInfo, repeats: repeats)
    }
}

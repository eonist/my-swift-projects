import Foundation
/**
 * Makes working with threads, queues, serial and concurrent tasks easier by using shorter/less cryptic names
 * - NOTE: there is also these: DISPATCH_QUEUE_PRIORITY_DEFAULT,DISPATCH_QUEUE_PRIORITY_HIGH,DISPATCH_QUEUE_PRIORITY_LOW
 * ## Examples:
 * bg.async{main.async{print("🎉")}}
 */
var bg: DispatchQueue = { DispatchQueue.global(qos:.background) }()
var main: DispatchQueue = { DispatchQueue.main }()
/**
 * Helps sleep whatever is defined within the PARAM: closure with-out blocking the app
 * - TODO: ⚠️️ You can put this method another place maybe?
 */
func bgSleep(_ sleepDurInSec: CGFloat, _ closure:@escaping () -> Void) {
    bg.async {
        sleep(UInt32(Int(sleepDurInSec)))/*start anim after N sec, but doesn't block the app*/
        main.async {
            closure()/*executes the closure*/
        }
    }
}

/**
 * Adds supports for fractional time
 */
func sleep(_ seconds: Double){
    usleep(useconds_t(seconds * 1000000)) // wait for n secs
}

import Foundation
/**
 * Makes working with threads, queues, serial and concurrent tasks easier by using shorter/less cryptic names
 */
//swift 3 update, remember that threading is simpler in swift 3

var bgQueue = {return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)}()//swift 3-> let taskQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
var bg:DispatchQueue {return bgQueue}/*Convenience*/
//there is also these: DISPATCH_QUEUE_PRIORITY_DEFAULT,DISPATCH_QUEUE_PRIORITY_HIGH,DISPATCH_QUEUE_PRIORITY_LOW

var mainQueue = {return DispatchQueue.main}()
var main:DispatchQueue {return mainQueue}/*Convenience*/
//swift 3 update, The bellow line may work, but maybe not. Do more swift 3 async research
func async(_ queue:DispatchQueue , _ block:@escaping () -> Void) -> Void {return queue.async(execute: block)}


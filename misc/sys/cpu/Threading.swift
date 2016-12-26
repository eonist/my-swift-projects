import Foundation
/**
 * Makes working with threads, queues, serial and concurrent tasks easier by using shorter/less cryptic names
 */
var bgQueue = {return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)}()//swift 3-> let taskQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
//there is also these: DISPATCH_QUEUE_PRIORITY_DEFAULT,DISPATCH_QUEUE_PRIORITY_HIGH,DISPATCH_QUEUE_PRIORITY_LOW
var mainQueue = {return dispatch_get_main_queue()}()
func async(queue:dispatch_queue_t , _ block:dispatch_block_t) -> Void {return dispatch_async(queue, block)}
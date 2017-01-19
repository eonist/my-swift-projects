import Foundation
/**
 * Makes working with threads, queues, serial and concurrent tasks easier by using shorter/less cryptic names
 */
//swift 3 update, remember that threading is simpler in swift 3

var bgQueue = {return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)}()//swift 3-> let taskQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
//there is also these: DISPATCH_QUEUE_PRIORITY_DEFAULT,DISPATCH_QUEUE_PRIORITY_HIGH,DISPATCH_QUEUE_PRIORITY_LOW
var mainQueue = {return DispatchQueue.main}()

//swift 3 updateupdate the bellow line when its needed
//func async(queue:dispatch_queue_t , _ block:dispatch_block_t) -> Void {return dispatch_async(queue, block)}

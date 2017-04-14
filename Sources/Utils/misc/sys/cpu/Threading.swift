import Foundation
/**
 * Makes working with threads, queues, serial and concurrent tasks easier by using shorter/less cryptic names
 * NOTE: there is also these: DISPATCH_QUEUE_PRIORITY_DEFAULT,DISPATCH_QUEUE_PRIORITY_HIGH,DISPATCH_QUEUE_PRIORITY_LOW
 * Example: bg.async{main.async{print("🎉")}}
 */
var bg = {return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)}()/*Convenience*/
var main = {return DispatchQueue.main}()/*Convenience*/

//LEGACY support:
func async(_ queue:DispatchQueue , _ block:@escaping () -> Void) -> Void {return queue.async(execute: block)}//swift 3 update, The bellow line may work, but maybe not. Do more swift 3 async research
//DEPRECATED
var mainQueue:DispatchQueue {return main}/*DEPRECATED*/
var bgQueue:DispatchQueue {return bg}/*DEPRECATED*/

import Foundation

/**
 * EXAMPLE: testPerformance("Adding styles took: "){CSSFileParser.cssString(url)}//Adding styles took 2.4secs
 * PARAM: startTime: performance test start time
 */
func testPerformance(_ context:String = "", _ startTime:NSDate = NSDate(), _ closure:@escaping ()->Void){
    closure()/*Executes the closure*/
    Swift.print(context + " \(abs(startTime.timeIntervalSinceNow))" + " Secs")/*Prints performance test end time*/
}
/**
 * Allows you to test performance and also return a value
 * EXAMPLE: let result:String = testPerformance{readData()}//0.028 Secs
 */
func testPerformance<T>(_ context:String = "", _ startTime:NSDate = NSDate(), _ closure:@escaping ()->T) -> T{
    defer {/*execute just before code execution leaves the current block of code*/
        Swift.print(context + " \(abs(startTime.timeIntervalSinceNow))" + " Secs")/*Prints performance test end time*/
    }
    return closure()/*Executes the closure*/
}

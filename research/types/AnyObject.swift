let userDefaults = NSUserDefaults.standardUserDefaults()
let lastRefreshDate: AnyObject? = userDefaults.objectForKey("LastRefreshDate")
func test(){
    if let date = lastRefreshDate as? NSDate {
        print("\(date.timeIntervalSinceReferenceDate)")
    }
}



//Alternatively, you can use the forced downcast operator (as!), which returns a non-optional value of the type you are trying to downcast to:

let myDate = lastRefreshDate as! NSDate
let timeInterval = myDate.timeIntervalSinceReferenceDate
//However, if a forced downcast fails, a runtime error is triggered:
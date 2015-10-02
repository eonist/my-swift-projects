



//nstimer


override func viewDidLoad() {
    super.viewDidLoad()

    var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "update", userInfo: nil, repeats: true)
}

// must be internal or public. 
func update() {
    // Something cool
}

//with param
var somethingToPass = "It worked"

let timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "tester:", userInfo: somethingToPass, repeats: false)

func tester(timer: NSTimer)
{
    let theStringToPrint = timer.userInfo as String
    println(theStringToPrint)
}

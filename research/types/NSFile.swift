//"~/a.txt".stringByExpandingTildeInPath // prints /Users/<your user>/a.txt

class Job {
    var title = ""
}
func test(){
    let job1 = Job()
    let job2 = job1
    job1.title = "singer"
    print(job2.title)
    
}

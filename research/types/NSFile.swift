//"~/a.txt".stringByExpandingTildeInPath // prints /Users/<your user>/a.txt

class Job {
    var title = ""
}

var job1 = Job()
var job2 = job1
job1.title = "singer"
print(job2.title)
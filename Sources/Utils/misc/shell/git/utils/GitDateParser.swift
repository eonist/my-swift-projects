import Foundation

class GitDateParser {
    /**
     * Returns an Array of dates for each commit in a repo within a time range
     */
    static func commitDates(localRepoPath:String,since:Date,until:Date) -> [(year:Int,month:Int,day:Int)]{
        let since:String = GitDateUtils.gitTime(since)
        let until:String = GitDateUtils.gitTime(until)
        let commitDatesStr:String = Utils.commitDates(localRepoPath: localRepoPath, since:since, until:until)
        let commitDates:[String] = StringParser.paragraphs(commitDatesStr)
        return commitDates.map {
            return Utils.date(date:$0)
        }
    }
    /**
     * New
     */
    static func lastCommitDate(localRepoPath:String) -> (year:Int,month:Int,day:Int){
        let date:String = Utils.lastCommitDate(localRepoPath:localRepoPath)
        return Utils.date(date: date)
    }
    /**
     * New
     */
    static func firstCommitDate(localRepoPath:String) -> (year:Int,month:Int,day:Int) {
        let date:String = Utils.firstCommitDate(localRepoPath:localRepoPath)
        return Utils.date(date: date)
    }
}
private class Utils{
    /**
     * Git command: git log --date=short --pretty='format:%cd'
     * OUTPUT: 2017-09-02 \n 2017-09-01
     */
    static func commitDates(localRepoPath:String,since:String,until:String) -> String{
        let shellScript:String = "\(Git.path + Git.git) \(Git.log) --since=\(since) --until=\(until) --date=short --pretty='format:%cd'"
        let result:String = ShellUtils.run(shellScript,localRepoPath)
        return result
    }
    /**
     * Date of first commit in git
     */
    static func firstCommitDate(localRepoPath:String)->String{
        let shellScript:String = "\(Git.path + Git.git) rev-list --max-parents=0 HEAD --date=short --pretty='format:%cd'"
        let result:String = ShellUtils.run(shellScript,localRepoPath)
        return result
    }
    /**
     * Date of last commit in git
     * NOTE: command: git log head~ -1
     */
    static func lastCommitDate(localRepoPath:String)->String{
        let shellScript:String = "\(Git.path + Git.git) \(Git.log) head~ -1"
        let result:String = ShellUtils.run(shellScript,localRepoPath)
        return result
    }
    /**
     * Converts 2017-09-02 -> (year:2017,month:09,day:02)
     */
    static func date(date:String) -> (year:Int,month:Int,day:Int){
        let parts:[String] = date.split("-")
        return (year:parts[0].int,month:parts[1].int,day:parts[2].int)
    }
}

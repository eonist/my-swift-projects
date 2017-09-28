import Foundation

class GitDateParser {
    /**
     * Returns an Array of dates for each commit in a repo within a time range
     */
    static func commitDates(localRepoPath:String,since:Date,until:Date) -> [YMD]{
        let since:String = GitDateUtils.gitTime(since)
//        Swift.print("since: " + "\(since)")
        let until:String = GitDateUtils.gitTime(until)
//        Swift.print("until: " + "\(until)")
        let commitDatesStr:String = Utils.commitDates(localRepoPath: localRepoPath, since:since, until:until)
//        Swift.print("commitDatesStr: " + "\(commitDatesStr)")
        let commitDates:[String] = StringParser.paragraphs(commitDatesStr)
//        Swift.print("commitDates.count: " + "\(commitDates.count)")
        return commitDates.map {
            return Utils.date(date:$0)
        }
    }
    /**
     * New
     */
    static func lastCommitDate(localRepoPath:String) -> YMD{
        let date:String = Utils.lastCommitDate(localRepoPath:localRepoPath)
        return Utils.date(date: date)
    }
    /**
     * New
     */
    static func firstCommitDate(localRepoPath:String) -> YMD {
        let date:String = Utils.firstCommitDate(localRepoPath:localRepoPath)
        return Utils.firstDate(date: date)
    }
}
private class Utils{
    /**
     * Git command: git log --date=short --pretty='format:%cd'
     * OUTPUT: 2017-09-02 \n 2017-09-01
     */
    static func commitDates(localRepoPath:String,since:String,until:String) -> String{
        let shellScript:String = "\(Git.path + Git.git) \(Git.log) --since=\"\(since.encode()!)\" --until=\"\(until.encode()!)\" --date=short --pretty=format:\("%cd".encode()!)"
//        Swift.print("shellScript: " + "\(shellScript)")
//        Swift.print("localRepoPath: " + "\(localRepoPath)")
        let result:String = ShellUtils.run(shellScript,localRepoPath)
//        Swift.print("result: " + "\(result)")
        return result
    }
    /**
     * Date of first commit in git (least recent aka "initial commit date")
     */
    static func firstCommitDate(localRepoPath:String)->String{
//        let shellScript:String = Git.path +  "git log --pretty=oneline --date=short --pretty=format:\("%cd".encode()!)  --reverse | head -1"//has pipe
        let shellScript:String = "\(Git.path + Git.git) rev-list --max-parents=0 HEAD --date=short --pretty=format:\("%cd".encode()!)"
//        Swift.print("shellScript: " + "\(shellScript)")
//        Swift.print("localRepoPath: " + "\(localRepoPath)")
        let result:String = ShellUtils.run(shellScript,localRepoPath)
//        Swift.print("result: " + "\(result)")
        return result
    }
    /**
     * Date of last commit in git (most recent)
     * NOTE: command: git log head~ -1  --date=short --pretty=format:%cd
     */
    static func lastCommitDate(localRepoPath:String)->String{
        let shellScript:String = "\(Git.path + Git.git) \(Git.log) head~ -1 --date=short --pretty=format:\("%cd".encode()!)"
        let result:String = ShellUtils.run(shellScript,localRepoPath)
        return result
    }
    static func firstDate(date:String) ->YMD {
        let paragraphs = date.split("\n")
        let lastParagraph = paragraphs[1]
        return Utils.date(date:lastParagraph)
    }
    /**
     * Converts 2017-09-02 -> (year:2017,month:09,day:02)
     */
    static func date(date:String) -> YMD{
//        Swift.print("date: " + "\(date)")
        let parts:[String] = date.split("-")
//        Swift.print("parts: " + "\(parts)")
        return .init(year:parts[0].int,month:parts[1].int,day:parts[2].int)
    }
}

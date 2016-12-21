import Foundation
class GitParser{
	/**
	 * Returns current git status
	 * @param: localPath is the path to the target repository on your local machine (posix path)
	 * NOTE: ~/someProject/someProject.git (use the ~ char if you want to access the users homve folder in OSX)
	 * NOTE: the cd is to move manouver into the local repository path, the ; char ends the call so you can make another call
	 * NOTE: To obtaine a more meaningfull list of items, create a metod that compiles a multidim accociative array derived from the text based staus
	 * NOTE: Appending -s simplifies the ret msg or you can also use --porcelain which does the same
	 * NOTE: make the option param optional with an if clause
	 */
	static func status(localPath:String, _ option:String)->String{
		//--log "localPath: " + localPath
		let shellScript:String = /*"cd " + localPath + ";" + */Git.path + "git status" + " " + option
		return ShellUtils.run(shellScript,localPath)
	}
	/**
	 * Retruns a log of what is new (less verbose with pretty oneline)
	 * NOTE: the cmd is: "git log"
     * NOTE: "git log --pretty=oneline" get a log of what is new, less verbose with pretty oneline
     * NOTE: "git log --oneline" (even cleaner than pretty=online)
	 * NOTE: "git log --oneline master..origin/master" to view the commit ids of the commits that the remote repo is ahead of local repo
	 * NOTE: "git log --oneline origin/master..master" commits the local branch is ahead of remote
	 */
	static func log(localPath:String, _ cmd:String)->String{
		let shellScript:String = /*"cd " + localPath + ";" + */Git.path + "git log " + cmd
		//Swift.print("shellScript: " + "\(shellScript)")
		return ShellUtils.run(shellScript,localPath)
	}
    /**
     * NEW
     * NOTE: can be used to show single commits
     */
    static func show(localPath:String, _ cmd:String)->String{
        let shellScript:String = Git.path + "git show " + cmd
        //Swift.print("shellScript: " + "\(shellScript)")
        return ShellUtils.run(shellScript,localPath)
    }
	/**
	 * Returns https://github.com/user/repository.git
	 */
	static func originUrl(localPath:String)->String{
		let shellScript:String = /*"cd " + localPath + ";" + */Git.path + "git config --get remote.origin.url"
		//--log "shellScript: " + shellScript
		return ShellUtils.run(shellScript,localPath)
	}
	/**
	 * Cherry
	 * NOTE: git cherry -v origin/master
	 * TODO: impliment user and pass when this is needed, use "" if not
	 * NOTE: this can be used to assert if there are any local commits ready to be pushed, if there are local commits then text will be returned, if there arent then there will be no text
	 * Caution: if you use git add with https login and pass, you need to run "git remote update" in order for the above note to work
	 * NOTE: branch: usually "master"
	 */
	static func cherry(localPath:String, _ branch:String)->String{
		let loc:String = "origin" //--"https://" + user_name + ":" + user_password + "@" + remote_repo_url
		let shellScript:String = /*"cd " + localPath + ";" + */Git.path + "git cherry" + " -v " + loc + "/" + branch
		return ShellUtils.run(shellScript,localPath)//--TODO: whats the -v, verbose?
	}
	/**
	 * git diff --name-only --diff-filter=U "outputs: text2.txt"
	 * git status -s "outputs UU text2.txt"
	 */
	static func unMergedFiles(localPath:String)->Array<String>{
		let unmMergedPaths:String = diff(localPath, "--name-only --diff-filter=U")
        Swift.print("unmMergedPaths: " + "\(unmMergedPaths)")
		return StringParser.paragraphs(unmMergedPaths)// :TODO: use some sort of linesToArray method here
	}
	/*
	 * "git diff --name-only --diff-filter=U" --returns a list of unmerged files
	 * NOTE: the digits within the @@ and @@ signs represents indices of the lines that changed. Like: @@ -1 +1,3 @@,do a test with numbered lines from 1 - 16 and remove some to see the meaning like in this research: http://stackoverflow.com/questions/10950412/what-does-1-1-mean-in-gits-diff-output
	 * NOTE: git diff returns a result if a file is removed (the removed file will look like this in the returned result: "--- path-to-removed-file")
	 * NOTE: git diff does not reurn a result if a file is added
	 * NOTE: git diff returns a result if a file is changed (the returned result will contain the lines that changed with a "-" preceding the line that is removed and a "+" preceding the line that is added)
	 */
    static func diff(localRepoPath:String, _ cmd:String)->String{
		let shellScript:String =  /*"cd " + localRepoPath + ";" + */Git.path + "git diff " + cmd
		return ShellUtils.run(shellScript,localRepoPath)
	}
    /**
     * Returns the commit count
     */
    static func commitCount(localRepoPath:String) -> String{
        let shellScript:String = Git.path + "git rev-list HEAD --count"
        var result:String = ShellUtils.run(shellScript,localRepoPath)
        result = result.trim("\n")/*the result sometimes has a trailing line-break, this must be removed*/
        return result
    }
    /**
     * NOTE: to find the first hash in a repo use this git command: git log -1 --pretty=format:"%H"
     * NOTE: Short hash and long hash works (for more precision use long hash)
     */
    static func commitCount(localRepoPath:String,_ hash1:String,_ hash2:String)->String{
        let shellScript:String = Git.path + "git rev-list "+hash1+" ^"+hash2+" --count"
        let result:String = ShellUtils.run(shellScript,localRepoPath)
        return result
    }
    /**
     * Returns the count from now until the date speccifed in PARAM: after
     * PARAM: after: "2016-10-12 00:00:00"  (git date format)
     */
    static func commitCount(localRepoPath:String, after:String)->String{
        let cmd = "git log --after=\""+after+"\" --format=oneline | wc -l"
        //Swift.print("cmd: " + "\(cmd)")
        let shellScript:String = cmd
        let result:String = ShellUtils.unsafeRun(shellScript,localRepoPath)
        result = result.trim("\n")/*the result sometimes has a trailing line-break, this must be removed*/
        Swift.print("result: " + "\(result)")
        return result
    }
    /**
     * DEPRECATED: Use GitParser.log instead
     * NOTE: the do_log name is used because applescript has reserved the log word for its own log method
     */
    static func doLog(localPath:String, _ cmd:String)->String{return log(localPath, cmd)}
}
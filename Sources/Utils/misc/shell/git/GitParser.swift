import Foundation
class GitParser{
	/**
	 * Returns current git status
	 * PARAM: localPath is the path to the target repository on your local machine (posix path)
	 * NOTE: ~/someProject/someProject.git (use the ~ char if you want to access the users home folder in macOS)
	 * NOTE: the cd is to move manouver into the local repository path, the ; char ends the call so you can make another call
	 * NOTE: To obtaine a more meaningfull list of items, create a metod that compiles a multidim accociative array derived from the text based staus
	 * NOTE: Appending -s simplifies the ret msg or you can also use --porcelain which does the same
	 * NOTE: make the option param optional with an if clause
	 */
	static func status(_ localPath:String, _ option:String)->String{
//        Swift.print("status.localPath: " + "\(localPath)")
		let shellScript:String = Git.path + Git.git + " " + Git.status + " " + option
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
	static func log(_ localPath:String, _ cmd:String)->String{
		let shellScript:String = Git.path + Git.git + " " + Git.log + " " + cmd
		return ShellUtils.run(shellScript,localPath)
	}
    /**
     * NOTE: can be used to show single commits
     * EXAMPLE: git show head~9 --pretty=format:"%ci" --no-patch (output: 2015-12-03 16:59:09 +0100)
     */
    static func show(_ localPath:String, _ cmd:String)->String{
        let shellScript:String = Git.path + Git.git + " " + Git.show + " " + cmd
        return ShellUtils.run(shellScript,localPath)
    }
	/**
	 * EXAMPLE: originUrl("Users/John/demo")//https://github.com/john/demo.git
	 */
	static func originUrl(_ localPath:String)->String{
		let shellScript:String = Git.path + Git.git + " " + Git.config + " --get remote.origin.url"
		var retVal = ShellUtils.run(shellScript,localPath)
        retVal = retVal.endsWith("\n") ? retVal.trimRight("\n") : retVal
        retVal = retVal.isWrappedWith("'") ? retVal.trim("'") : retVal
        return retVal
	}
	/**
	 * Cherry
	 * NOTE: git cherry -v origin/master
	 * NOTE: this can be used to assert if there are any local commits ready to be pushed, if there are local commits then text will be returned, if there arent then there will be no text
	 * NOTE: branch: usually "master"
	 * CAUTION: ⚠️️ If you use git add with https login and pass, you need to run "git remote update" in order for the above note to work
	 * TODO: impliment user and pass when this is needed, use "" if not
	 */
	static func cherry(_ localPath:String, _ branch:String)->String{
		let loc:String = Git.origin /*--"https://" + user_name + ":" + user_password + "@" + remote_repo_url*/
		let shellScript:String = Git.path + Git.git + " " + Git.cherry  + " -v " + loc + "/" + branch
		return ShellUtils.run(shellScript,localPath)//--TODO: whats the -v, verbose?
	}
	/**
	 * git diff --name-only --diff-filter=U "outputs: text2.txt"
	 * git status -s "outputs UU text2.txt"
     * NOTE: basically remote file has changes that never has been applied to local file.
	 */
	static func unMergedFiles(_ localPath:String)->[String]{
		let unmMergedPaths:String = diff(localPath, "--name-only --diff-filter=U")
        return StringParser.paragraphs(unmMergedPaths)// :TODO: use some sort of linesToArray method here
	}
	/*
	 * "git diff --name-only --diff-filter=U" --returns a list of unmerged files
	 * NOTE: the digits within the @@ and @@ signs represents indices of the lines that changed. Like: @@ -1 +1,3 @@,do a test with numbered lines from 1 - 16 and remove some to see the meaning like in this research: http://stackoverflow.com/questions/10950412/what-does-1-1-mean-in-gits-diff-output
	 * NOTE: git diff returns a result if a file is removed (the removed file will look like this in the returned result: "--- path-to-removed-file")
	 * NOTE: git diff does not reurn a result if a file is added
	 * NOTE: git diff returns a result if a file is changed (the returned result will contain the lines that changed with a "-" preceding the line that is removed and a "+" preceding the line that is added)
	 */
    static func diff(_ localRepoPath:String, _ cmd:String)->String{
		let shellScript:String = Git.path + Git.git + " " + Git.diff + " " + cmd
//        Swift.print("shellScript: " + "\(shellScript)")
		return ShellUtils.run(shellScript,localRepoPath)
	}
}

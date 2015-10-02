import "ShellUtils.swift"
class GitParser{
	class var gitPath : String = "/usr/local/git/bin/" //--to execute git commands we need to call the git commands from this path
	/*
	 * Returns current git status
	 * @param: localPath is the path to the target repository on your local machine (posix path)
	 * NOTE: ~/someProject/someProject.git (use the ~ char if you want to access the users homve folder in OSX)
	 * NOTE: the cd is to move manouver into the local repository path, the ; char ends the call so you can make another call
	 * NOTE: To obtaine a more meaningfull list of items, create a metod that compiles a multidim accociative array derived from the text based staus
	 * NOTE: Appending -s simplifies the ret msg or you can also use --porcelain which does the same
	 * NOTE: make the option param optional with an if clause
	 */
	func status(localPath, option){
		//--log "localPath: " + localPath
		return ShellUtils.run("cd " + localPath + ";" + gitPath + "git status" + " " + option
	}
	/*
	 * Retruns a log of what is new (less verbose with pretty oneline)
	 * NOTE: "git log --pretty=oneline" --get a log of what is new, less verbose with pretty oneline
	 * NOTE: the cmd is: "git log"
	 * NOTE: the do_log name is used because applescript has reserved the log word for its own log method
	 * NOTE: git log --oneline
	 * NOTE: "git log --oneline master..origin/master" to view the commit ids of the commits that the remote repo is ahead of local repo
	 * NOTE: "git log --oneline origin/master..master" commits the local branch is ahead of remote
	 */
	func doLog(localPath, cmd){
		set shellScript = "cd " + localPath + ";" + gitPath + "git log " + cmd
		//--log "shellScript: " + shellScript
		return ShellUtils.run(shellScript)
	}
	/*
	 *Returns https://github.com/user/repository.git
	 */
	func originUrl(localPath){
		set shellScript = "cd " + localPath + ";" + gitPath + "git config --get remote.origin.url"
		//--log "shellScript: " + shellScript
		return ShellUtils.run(shellScript)
	}
	/*
	 * Cherry
	 * NOTE: git cherry -v origin/master
	 * TODO: impliment user and pass when this is needed, use "" if not
	 * NOTE: this can be used to assert if there are any local commits ready to be pushed, if there are local commits then text will be returned, if there arent then there will be no text
	 * Caution: if you use git add with https login and pass, you need to run "git remote update" in order for the above note to work
	 * NOTE: branch: usually "master"
	 */
	func cherry(localPath, branch){
		set loc = "origin" //--"https://" + user_name + ":" + user_password + "@" + remote_repo_url
		return ShellUtils.run("cd " + localPath + ";" + gitPath + "git cherry" + " -v " + loc + "/" + branch )//--TODO: whats the -v, verbose?
	}
	
	/* 
	 * git diff --name-only --diff-filter=U "outputs: text2.txt"
	 * git status -s "outputs UU text2.txt"
	 */
	func unMergedFiles(localPath){
		var unmMergedPaths = diff(localPath, "--name-only --diff-filter=U")
		return unmMergedPaths.componentsSeparatedByString("\n")//// :TODO: use some sort of linesToArray method here
	}
	/*
	 * "git diff --name-only --diff-filter=U" --returns a list of unmerged files
	 * NOTE: the digits within the @@ and @@ signs represents indices of the lines that changed. Like: @@ -1 +1,3 @@,do a test with numbered lines from 1 - 16 and remove some to see the meaning like in this research: http://stackoverflow.com/questions/10950412/what-does-1-1-mean-in-gits-diff-output
	 * NOTE: git diff returns a result if a file is removed (the removed file will look like this in the returned result: "--- path-to-removed-file")
	 * NOTE: git diff does not reurn a result if a file is added
	 * NOTE: git diff returns a result if a file is changed (the returned result will contain the lines that changed with a "-" preceding the line that is removed and a "+" preceding the line that is added)
	 */
	func diff(localRepoPath, cmd){
		return ShellUtils.run( "cd " + localRepoPath + ";" + gitPath + "git diff " + cmd)
	}
}


//continue here, clean up the above class


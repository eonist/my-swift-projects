import Foundation
class GitAsserter{
	/**
	 * Asserts if a folder has a git repository
	 * Example: is_git_repo("~/test/.git/")--true/false
	 * Note: Asserts 2 states: folder does not have a git repository, folder exists and has a git repository attatched, only returns true for the last case
	 * Note: Its wise to assert if the folder exists first, use FileAsserter's does_path_exist("~/test/.git/")
	 */
	static func isGitRepo(filePath:String)->Bool{
		return GitParser.status(filePath, "") != ""
	}
	/**
	 * 
	 */
	static func hasRemoteRepoAttached(filePath:String, _ branch:String)->Bool{
		return GitParser.status(filePath, "origin" + "/" + branch) != ""
	}
	/**
	 * Asserts if a remote branch is ahead of a local branch
     * NOTE: We use this command: "git log --oneline master..origin/master" to view the commit ids of the commits that the remote repo is ahead of local repo
	 */
	static func isRemoteBranchAhead(localPath:String, _ branch:String)->Bool{
		//Swift.print("GitAsserter's is_remote_branch_ahead()")
		let theLog:String = GitParser.doLog(localPath, "--oneline " + branch + ".." + "origin" + "/" + branch)
		//Swift.print("theLog: " + "\(theLog)")
		let logList:Array<String> = StringParser.paragraphs(theLog)
		let isAhead:Bool = logList.count > 0
		return isAhead
	}
	/**
	 * You could also maybe use log to assert this, see is_remote_branch_ahead but opposite
	 */
	static func hasLocalCommits(localRepoPath:String, _ branch:String)->Bool{
		//--log "GitAsserter's has_local_commits()"
		//--move the bellow to gitModifier?
		GitModifier.gitRemoteUpdate(localRepoPath) //--in order for the cherry to work with "git add" that uses https, we need to call this method
		let cherryResult:String = GitParser.cherry(localRepoPath, branch)
		Swift.print("cherryResult: " + "\(cherryResult)")
		let hasCommits:Bool = (cherryResult.characters.count > 0)
		return hasCommits
	}
	/**
	 * Asserts if there are unmerged paths that needs resolvment
	 */
	static func hasUnMergedPaths(localPath:String)->Bool{
		//Swift.print("hasUnMergePaths")
        let result = GitParser.unMergedFiles(localPath)
        Swift.print("result: " + "\(result)")
		return result.count > 0
	}
}
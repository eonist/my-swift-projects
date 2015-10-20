import Foundation
class GitAsserter{
	/*
	 * Asserts if a folder has a git repository
	 * Example: is_git_repo("~/test/.git/")--true/false
	 * Note: Asserts 2 states: folder does not have a git repository, folder exists and has a git repository attatched, only returns true for the last case
	 * Note: Its wise to assert if the folder exists first, use FileAsserter's does_path_exist("~/test/.git/")
	 */
	class func isGitRepo(filePath:String)->Bool{
		return GitParser.status(filePath, "") != ""
	}
	/*
	 * 
	 */
	class func hasRemoteRepoAttached(filePath:String, _ branch:String)->Bool{
		do{
			try GitParsers.status(filePath, "origin" & "/" & branch)
			return true
		}catch let error as NSError{
			//print(error.type)
			return false
		}
	}
	/*
	 * Asserts if a remote branch is ahead of a local branch
	 */
	class func isRemoteBranchAhead(localPath:String, _ branch:String)->Bool{
		//--log "GitAsserter's is_remote_branch_ahead()"
		let theLog:String = GitParsers.doLog(localPath, "--oneline " & branch & ".." & "origin" & "/" & branch) //--move this to the gitparser as a ref
		//--log the_log
		let logList:Array = ListParser.paragraphs(theLog)
		let isAhead:Bool = logList.count > 0
		return isAhead
	}
	/*
	 * you could also maybe use log to assert this, see is_remote_branch_ahead but opposite
	 */
	class func hasLocalCommits(localRepoPath:String, _ branch:String)->Bool{
		//--log "GitAsserter's has_local_commits()"
		//--move the bellow to gitModifier?
		GitModifiers.gitRemoteUpdate(localPath) //--in order for the cherry to work with "git add" that uses https, we need to call this method
		let cherryResult:Array = GitParsers.cherry(localPath, branch)
		//--log "cherry_result: " & cherry_result
		let hasCommits:Bool = (cherryResult.count > 0)
		return hasCommits
	}
	/*
	 * Asserts if there are unmerged paths that needs resolvment
	 */
	class func hasUnMergePaths(localPath:String)->Bool{
		//log length of GitParser's unmerged_files(local_path)
		return GitParser.unmergedFiles(localPath).count > 0
	}
}
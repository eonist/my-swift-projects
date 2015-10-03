import "git/GitAsserter.applescript"
import "file/FileAsserter.applescript"
import "git/GitParser.applescript"
import "git/GitModifier.applescript"
class GitAsserter{
	/*
	* Asserts if a folder has a git repository
	* Example: is_git_repo("~/test/.git/")--true/false
	* Note: Asserts 2 states: folder does not have a git repository, folder exists and has a git repository attatched, only returns true for the last case
	* Note: Its wise to assert if the folder exists first, use FileAsserter's does_path_exist("~/test/.git/")
	*/
	func isGitRepo(filePath:String)->Bool{
		do{
			try GitParsers.status(filePath, "")
			return true
		}catch let error as NSError{
			//print(error.type)
			return false
		}
	}
	/*
	 * 
	 */
	func hasRemoteRepoAttached(filePath, branch)->Boolean{
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
	func isRemoteBranchAhead(localPath, branch)->Boolean{
		//--log "GitAsserter's is_remote_branch_ahead()"
		let theLog to GitParsers.doLog(localPath, "--oneline " & branch & ".." & "origin" & "/" & branch) //--move this to the gitparser as a ref
		//--log the_log
		let logList to ListParser.paragraphs( the_log)
		if (log_list.count > 0) {
			return true
		}else{
			return false
		}
	}
	/*
	 * you could also maybe use log to assert this, see is_remote_branch_ahead but opposite
	 */
	func hasLocalCommits(localRepoPath, branch)->Boolean{
		//--log "GitAsserter's has_local_commits()"
		//--move the bellow to gitModifier?
		GitModifiers.gitRemoteUpdate(localPath) //--in order for the cherry to work with "git add" that uses https, we need to call this method
		let cherryResult = GitParsers.cherry(localPath, branch)
		//--log "cherry_result: " & cherry_result
		let hasCommits = (cherry_result.count > 0)
		return hasCommits
	}
	
	/*
	 * Asserts if there are unmerged paths that needs resolvment
	 */
	func hasUnMergePaths(localPath)->Boolean{
		//log length of GitParser's unmerged_files(local_path)
		return GitParser.unmergedFiles(localPath).count > 0
	}
}
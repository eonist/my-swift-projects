import Foundation
class GitAsserter{
	/**
	 * Asserts if a folder has a git repository
	 * Example: is_git_repo("~/test/.git/")--true/false
	 * Note: Asserts 2 states: folder does not have a git repository, folder exists and has a git repository attatched, only returns true for the last case
	 * Note: Its wise to assert if the folder exists first, use FileAsserter's does_path_exist("~/test/.git/")
	 */
	static func isGitRepo(_ filePath:String)->Bool{
		return GitParser.status(filePath, "") != ""
	}
	/**
	 * Asserts if remote repo is attached
	 */
	static func hasRemoteRepoAttached(_ filePath:String, _ branch:String)->Bool{
		return GitParser.status(filePath, Git.origin + "/" + branch) != ""
	}
	/**
	 * Asserts if a remote branch is ahead of a local branch
     * NOTE: We use this command: " " to view the commit ids of the commits that the remote repo is ahead of local repo
	 */
	static func isRemoteBranchAhead(_ localPath:String, _ branch:String)->Bool{
		//Swift.print("GitAsserter's is_remote_branch_ahead()")
		let theLog:String = GitParser.log(localPath, "--oneline " + branch + ".." + Git.origin + "/" + branch)
		let logList:[String] = StringParser.paragraphs(theLog)
		let isAhead:Bool = logList.count > 0
		return isAhead
	}
	/**
	 * You could also maybe use log to assert this, see is_remote_branch_ahead but opposite
	 */
	static func hasLocalCommits(_ localRepoPath:String, _ branch:String)->Bool{
		//--move the bellow to gitModifier?
		_ = GitModifier.gitRemoteUpdate(localRepoPath)/*🌵 in order for the cherry to work with "git add" that uses https, we need to call this method*/
		let cherryResult:String = GitParser.cherry(localRepoPath, branch)//🌵
		//Swift.print("cherryResult: " + "\(cherryResult)")
		let hasCommits:Bool = (cherryResult.characters.count > 0)
		return hasCommits
	}
	/**
	 * Asserts if there are unmerged paths that needs resolvment
	 */
	static func hasUnMergedPaths(_ localPath:String)->Bool{
		//Swift.print("hasUnMergePaths")
        let result = GitParser.unMergedFiles(localPath)
		return !result.isEmpty
	}
    /**
     * TODO: ⚠️️ Implement when needed ref: https://stackoverflow.com/questions/12170459/check-if-git-remote-exists-before-first-push
     */
    static func doesRemoteExist(){
        //git ls-remote --exit-code https://github.com/gitsync/SQLiteLib.git
    }
}

--property GitAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitAsserter.applescript"))
property ScriptLoader : load script alias ((path to scripts folder from user domain as text) & "file:ScriptLoader.scpt") --prerequisite for loading .applescript files
property FileAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "file:FileAsserter.applescript"))
property GitParser : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitParser.applescript"))
property GitModifier : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "git:GitModifier.applescript"))
/*
* Asserts if a folder has a git repository
* Example: is_git_repo("~/test/.git/")--true/false
* Note: Asserts 2 states: folder does not have a git repository, folder exists and has a git repository attatched, only returns true for the last case
* Note: Its wise to assert if the folder exists first, use FileAsserter's does_path_exist("~/test/.git/")
*/
func isGitRepo(filePath:String){
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
func hasRemoteRepoAttached(filePath, branch){
	do{
		try GitParsers.status(filePath, "origin" & "/" & branch)
		return true
	}catch error
		return false
	end try
}
/*
 * Asserts if a remote branch is ahead of a local branch
 */
func is_remote_branch_ahead(local_repo_path, branch){
	//--log "GitAsserter's is_remote_branch_ahead()"
	set the_log to GitParser's do_log(local_repo_path, "--oneline " & branch & ".." & "origin" & "/" & branch) --move this to the gitparser as a ref
	//--log the_log
	set log_list to paragraphs of the_log
	if (length of log_list > 0) then
		return true
	else
		return false
	end if
}
/*
 * you could also maybe use log to assert this, see is_remote_branch_ahead but opposite
 */
func has_local_commits(local_repo_path, branch){
	//--log "GitAsserter's has_local_commits()"
	//--move the bellow to gitModifier?
	GitModifier's git_remote_update(local_repo_path) --in order for the cherry to work with "git add" that uses https, we need to call this method
	set cherry_result to GitParser's cherry(local_repo_path, branch)
	//--log "cherry_result: " & cherry_result
	set has_commits to (length of cherry_result > 0)
	return has_commits
}

/*
 * Asserts if there are unmerged paths that needs resolvment
 */
func hasUnMergePaths(localPath)->Boolean{
	//log length of GitParser's unmerged_files(local_path)
	return GitParser.unmergedFiles(localPath).count > 0
}
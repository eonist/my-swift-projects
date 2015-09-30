class GitParser{
	class var git_path : String = "/usr/local/git/bin/" --to execute git commands we need to call the git commands from this path
	/*
	 * git diff --name-only --diff-filter=U "outputs: text2.txt"
	 * git status -s "outputs UU text2.txt"
	 */
	func unMergedFiles(localPath){
		var unmergedPaths = diff(localPath, "--name-only --diff-filter=U")
		return paragraphs of unmergedPaths//// :TODO: use some sort of linesToArray method here
	}
	/*
	 * "git diff --name-only --diff-filter=U" --returns a list of unmerged files
	 * NOTE: the digits within the @@ and @@ signs represents indices of the lines that changed. Like: @@ -1 +1,3 @@,do a test with numbered lines from 1 - 16 and remove some to see the meaning like in this research: http://stackoverflow.com/questions/10950412/what-does-1-1-mean-in-gits-diff-output
	 * NOTE: git diff returns a result if a file is removed (the removed file will look like this in the returned result: "--- path-to-removed-file")
	 * NOTE: git diff does not reurn a result if a file is added
	 * NOTE: git diff returns a result if a file is changed (the returned result will contain the lines that changed with a "-" preceding the line that is removed and a "+" preceding the line that is added)
	 */
	func diff(localRepoPath, cmd){
		return ShellUtils.run( "cd " & local_repo_path & ";" & git_path & "git diff " & cmd)
	}
}


//continue here, clean up the above class
class GitUtils{
	/**
	 * Manual pull
	 * CAUTION: It's best practice to always commit any uncommited files before you attempt to pull
	 * CAUTION: Remember to wrap this method in a try error clause, so that you can handle merge conflicts
	 * NOTE: the goal of this method is to arrive at the same state as the remote branch
	 * TODO: add support for different local and remote branch name
	 */
    static func manualPull(_ repo:GitRepo) -> Bool{
		//Swift.print("GitUtils.manualPull()")
		_ = GitModifier.fetch(repo)//--git fetch origin master, retrive the latest repo info
		let isRemoteBranchAhead:Bool = GitAsserter.isRemoteBranchAhead(repo.localPath, repo.branch) //--use the git log oneline thing here	--git log --oneline master..origin/master (to view the commit ids of the commits that the remote repo is ahead of local repo )
		//Swift.print("isRemoteBranchAhead: " + "\(isRemoteBranchAhead)")
		if isRemoteBranchAhead { //--asserts if a merge isneeded
			Swift.print("remote branch is ahead, so there is something to merge")
			let result = GitModifier.merge(repo.localPath, repo.branch, "origin/" + repo.branch) //--git merge master origin/master (merges the changes from remote that you just fetched)
            Swift.print("⚠️️⚠️️⚠️️ result: " + "\(result)")
            return true
        }else{
			Swift.print("nothing to merge, local branch is up-to-date")
            return false
		}
        //fatalError("handle the result first, success or error and return this as bool")
        //return true//temp
	}
	/**
	 * Manually clone a git to a local folder
	 * NOTE:  same as clone but differs in that it clones into an existing folder
	 * TODO: this method is wrong see git workflows on gitsyncs github.com
	 */
	static func manualClone(_ locaPath:String, _ remotePath:String){
		//--"git init" <--Installs the invisible .git folder
		//--TODO: do reasearch with different posix paths ~/testing/ vs Users/Joe/testing vs macintosh hd/ user / etc, and how to convert between them
		//--"git remote add origin https://github.com/user/testing.git" <-- attach a remote repo
		//--"git fetch origin master" <--Download the latest .git data
		//--"git checkout master" <-- Switches to the master branch (if you are already there then skip this)
		//--"git fetch origin master" <-- Do this Again to download the latest .git data  , since your ahead sort of
	}
    /**
     * Returns the commit count
     * CAUTION: returns count +1
     * Alt command: git log  --pretty=format:"Sha1: %h" | wc -l  outputs correct count
     */
    static func commitCount(_ localRepoPath:String) -> String{
        let shellScript:String = Git.path + "git rev-list HEAD --count"
        var result:String = ShellUtils.run(shellScript,localRepoPath)
        result = result.trim("\n")/*the result sometimes has a trailing line-break, this must be removed*/
        return result
    }
    /**
     * NOTE: to find the first hash in a repo use this git command: git log -1 --pretty=format:"%H"
     * NOTE: Short hash and long hash works (for more precision use long hash)
     */
    static func commitCount(_ localRepoPath:String,_ hash1:String,_ hash2:String)->String{
        let shellScript:String = Git.path + "git rev-list "+hash1+" ^"+hash2+" --count"
        let result:String = ShellUtils.run(shellScript,localRepoPath)
        return result
    }
    /**
     * Returns the count from now until the date speccifed in PARAM: after
     * PARAM: after: "2016-10-12 00:00:00" (git date format)
     */
    static func commitCount(_ localRepoPath:String, after:String)->String{
        let cmd = "git log --after=\"" + after + "\" --format=oneline | wc -l | tr -d ' ' | tr -d '\n'"//the two last pipes remove space and newLine chars (awk '{$1=$1};1'  could also be used to remove wrapping space chars)
        //Swift.print("cmd: " + "\(cmd)")
        let shellScript:String = cmd
        let result:String = ShellUtils.unsafeRun(shellScript,localRepoPath)
        //result = result.trim("\n")/*the result sometimes has a trailing line-break, this must be removed*/
        //Swift.print("result: " + "\(result)")
        return result
    }
    /**
     * NOTE: There is also: --since --before
     * NOTE: git log --after="2013-11-12 00:00" --before="2013-11-12 23:59"
     */
    static func commitCount(_ localRepoPath:String, since:String, until:String)->String{
        let cmd = "git log --since=\"01-Dec-2016\" --until=\"31-Dec-2016\""
    }
}

import Foundation

class GitModifier{
   /**
    * Add a file or many files to a commit
    * PARAM: fileName is the file name you want to add, use * if you want to add all files
    * NOTE: The opposite of add is reset, see the reset method for more info
    * CAUTION: ⚠️️ When a file is removed, the * char wont work, you have to add the file manually
    * EXAMPLE: GitUtils's add(localRepoPath, "*")
    */
   static func add(_ localRepoPath:String, _ fileName:String)->String{
        let shellScript:String = Git.path + Git.git + " " + Git.add + " " + fileName
        return ShellUtils.run(shellScript,localRepoPath)
   }
   /*
    * Commits current changes
    * Return example: [master af86d55] added
    * PARAM: msg example: "created index.html file"
    * 1 file changed, 0 insertions(+), 0 deletions(-)
    * create mode 100644 error.html
    * NOTE: Commit , usually doesnt return anything
    * NOTE: its important that the message is between two single quates
    * NOTE: There is no "extended description" concept in git. Only the commit message. What happens is that the commit message can have a single line or multiple lines External tools or websites such as git-cola or GitHub can interpret multiple lines commit messages as: The first line is a short description All the other lines are an extended description For one line messages, only the "short description" is defined.
    * TODO: ⚠️️ Can we also add desscription to a commit?
    * TODO: ⚠️️ what does commit -a do? -all?
    * TODO: ⚠️️ git commit -m "Title" -m "Description .........." <--this works
    * EXAMPLE: GitUtils's commit(localRepoPath, "changes made")
    */
    static func commit(_ localRepoPath:String, _ msg:CommitMessage)->String{
    	let shellScript:String = Git.path + Git.git + " " + Git.commit + " -m " + msg.title.encode()! + " -m " + msg.description.encode()! + ""
    	return ShellUtils.run(shellScript,localRepoPath)
   }
   /*
    * The opposite of the add action
    * Important: You should never use git reset <commit> when any snapshots after <commit> have been pushed to a public repository
    * NOTE: The * resets all
    * NOTE: git reset <file> --Removes a file from the staging area, aka unstagin a file
    * NOTE: git reset --hard --Removes a file from the staging area and the actual file (does not remove an untracked file)
    * NOTE: git reset --Removes all files form the staging area, opposite of 
    * NOTE: git reset <commit> --reset the staging area to a specific commit id, this is great when you want to group a bunch of commits together
    * NOTE: git reset --hard <commit>--reset the staging area and the actual files to a specific commit id (does not remove untracked files)
    * NOTE: git reset --hard HEAD~2--resets 2 commits backward, also removes the actual files (does not remove untracked files)
    * NOTE: "git reset --hard" (Undo changes in tracked files)
    * NOTE: "git clean -df" (Remove untracked files, does not remove .ignored files, use "-xf" for that)
    */
   static func reset(_ localRepoPath:String, _ fileName:String)->String{
    let shellScript:String = Git.path + Git.git + " " + Git.reset + " " + fileName
   	return ShellUtils.run(shellScript,localRepoPath)
   }
   
   /**
    * Downloads the current from the remote git to the local git (git pull = git fetch + git merge)
    * NOTE: the original git cmd is "git pull origin master"
    * NOTE: "https://user:pass@github.com/user/repo.git"
    * NOTE: returns "Already up-to-date." if there are nothing to pull from remote
    * TODO: ⚠️️ Do we need login and pass for pulling? - for private repos, yes
    * NOTE: In the simplest terms, git pull does a git fetch followed by a git merge.
    * TODO: ⚠️️ What is git pull --rebase <remote>. Same as the above command, but instead of using git merge to integrate the remote branch with the local one, use git rebase.
    * NOTE: you can also do "git pull" if you are already switched into the branch you want to pull and there is only one remote repo attached to the local repo
    */
    static func pull(_ repo:GitRepo, _ key:GitKey? = nil)->String{
        let credentials:String = key != nil ? key!.user + ":" + key!.pass + "@" : ""
        let remoteLocation:String = "https://" + credentials + repo.remotePath
        let shellScript:String = Git.path + Git.git + " " + Git.pull + " " + remoteLocation + " " + repo.branch
//        Swift.print("shellScript: " + "\(shellScript)")
        return ShellUtils.run(shellScript,repo.localPath)
    }
    /**
     * Uploads the current from the local git commits to the remote git
     * PARAM: from_where: "master"
     * PARAM: to_where: "origin"
     * PARAM: remotePath: github.com/user-name/repo-name.git
     * PARAM: branch: usually "master"
     * NOTE: if the remote history has diverged from your history, you need to pull the remote branch and merge it into your local one,
     * NOTE: git push <remote> <branch> (Push the specified branch to <remote>, along with all of the necessary commits and internal objects. This creates a local branch in the destination repository. To prevent you from overwriting commits, Git won�t let you push when it results in a non-fast-forward merge in the destination repository.)
     * NOTE: you may mitigate using username and pass by researching how to use SSH key in github from trusted maschines
     * NOTE: Original gti cmd: git push https://github.com/user/test.git master
     * NOTE: ssh-example: ssh://user@host/path/to/repo.git
     * NOTE: Only Push to Bare Repositories In addition, you should only push to repositories that have been created with the --bare flag. Since pushing messes with the remote branch structure, it's important to never push to another developers repository. But because bare repos don't have a working directory, it's impossible to interrupt anybodys developments.
     * NOTE: The only time you should ever need to force push is when you realize that the commits you just shared were not quite right and you fixed them with a git commit --amend or an interactive rebase. However, you must be absolutely certain that none of your teammates have pulled those commits before using the --force option.
     * NOTE: you can also do "git push" if you are already switched into the branch you want to push and there is only one remote repo attached to the local repo
     * NOTE: remove remote feature branch: git push origin --delete <branch-name>
     * EXAMPLE: GitUtils's push(localRepoPath, "github.com/user-name/repo-name.git", userName, userPassword)
     * TODO: ⚠️️ maybe add try error when doing the shell part
     */
    static func push(_ repo:GitRepo, _ key:GitKey)->String{
        let remoteLoc:String = "https://\(key.user):\(key.pass)@\(repo.remotePath)"
        let shellScript:String = "\(Git.path + Git.git + " " + Git.push + " " + remoteLoc) \(repo.branch)"
        let retVal = ShellUtils.run(shellScript,repo.localPath)
        return retVal
    }
   /**
    * Initialize
    * NOTE: used to be named "init" but this is occupied by swif it self, so initialize it is
    */
    static func initialize(_ localRepoPath:String)->String{
        let shellScript:String = Git.path + Git.git + " " + Git.initiate
        return ShellUtils.run(shellScript,localRepoPath)
    }
   /**
    * Attach a remote repo to a local repo
    * NOTE: git remote add origin https://github.com/user/test.git
    * NOTE: git remote add john http://dev.example.com/john.git (YOu can also add other teammates git repos to the same repo as above)
    * NOTE: to retrive the origin url: "git config --get remote.origin.url"
    * NOTE: There is also: git remote set-url origin <URL>
    */
   static func attachRemoteRepo(_ localRepoPath:String, _ remoteRepoPath:String)->String{
       let shellScript:String = Git.path + Git.git + " " + Git.remote + " " + Git.add + " " + Git.origin + " " + remoteRepoPath//<-this could be the " sign
        //StringModifier.wrapWith(remoteRepoPath, "'")
       return ShellUtils.run(shellScript,localRepoPath)
   }
   /**
    * Detach a remote repo of a local repo
    * NOTE: the reverse of attach_remote_repo method
    * NOTE: git remote rm origin
    */
   static func detachRemoteRepo(_ localRepoPath:String)->String{
       let shellScript:String = Git.path + Git.git + " " +  Git.remote + " " + Git.rm + " " + Git.origin
       return ShellUtils.run(shellScript,localRepoPath)
   }
    /**
     * Replaces current remote url
     * Git terminal syntax: git remote set-url origin https://github.com/username/repo
     * PARAM: replacmentRepoRemote: https://github.com/username/repo
     */
    static func replaceRemote(localRepoPath:String, replacementRepoRemote:String)->String{
        let shellScript:String = Git.path + Git.git + " " +  Git.remote + " " + "set-url" + " " + Git.origin + " " + replacementRepoRemote
//        Swift.print("shellScript: " + "\(shellScript)")
        return ShellUtils.run(shellScript,localRepoPath)
    }
   /**
    * Clone
    * NOTE: Cloning automatically creates a remote connection called "origin" pointing back to the original repository.
    * NOTE: git clone <repo> <directory>
    */
   static func clone(_ remotePath:String, _ localPath:String)->String{
        let shellScript:String = Git.path + Git.git + " " + Git.clone + " " + remotePath + " " + localPath
//        Swift.print("GitModifier.clone() shellScript: \(shellScript)")
        return ShellUtils.run(shellScript,localPath)
   }
   /**
    * NOTE: brings your remote refs up to date
    * TODO: Ellaborate, it seems this method is needed to get the cherry method to work, can it be used with specific branches?
    */
   static func gitRemoteUpdate(_ localRepoPath:String)->String{
       let shellScript:String = Git.path + Git.git + " " + Git.remote + " " + Git.update
       return ShellUtils.run(shellScript,localRepoPath)
   }
   /**
    * Fetch
    * NOTE: Fetching is what you do when you want to see what everybody else has been working on. Since fetched content is represented as a remote branch, it has absolutely no effect on your local development work. This makes fetching a safe way to review commits before integrating them with your local repository.
    * NOTE: The git fetch command downloads commits from a remote repository into your local repo, does not download the actual files
    * NOTE: git fetch <remote> (Fetch all of the branches from the repository. This also downloads all of the required commits and files from the other repository.)
    * NOTE: git fetch <remote> <branch> (Same as the above command, but only fetch the specified branch.)
    * NOTE: you can switch to the fetched branch with: "git checkout origin/master" then do "git log --oneline master..origin/master" to view the commit ids of the commits that the remote repo is ahead of local repo
    * TODO: ⚠️️ does this work here: "git checkout --theirs *"  or "git checkout --ours *"
    * TODO: ⚠️️ add branch support I suppose ?
    */
    static func fetch(_ repo:GitRepo)->String{
       var shellScript:String = Git.path + Git.git + " " + Git.fetch + " " + Git.origin
       if(repo.branch != " "){ shellScript += " " + repo.branch}
//        Swift.print("shellScript: " + "\(shellScript)")
       return ShellUtils.run(shellScript,repo.localPath)
   }
   /**
    * Merging is Git's way of putting a forked history back together again
    * PARAM: fromBranch the branch you want to apply to the PARAM: into_branch
    * PARAM: into_branch is the branch you usually checkout before doing the merge
    * NOTE: If the two branches your trying to merge both changed the same part of the same file, Git wont be able to figure out which version to use. When such a situation occurs, it stops right before the merge commit so 
    * NOTE: Note that merge conflicts will only occur in the event of a 3-way merge. It�s not possible to have conflicting changes in a fast-forward merge.
    * NOTE: The current branch will be updated to reflect the merge, but the target branch will be completely unaffected. 
    * NOTE: to list all local branches in your repo do: "git branch"
    * NOTE: to list all remote branches in your repo do: "git branch -r"
    * NOTE: "git branch -D branch_name_here" Force delete the specified branch, even if it has unmerged changes. This is the command to use if you want to permanently throw away all of the commits associated with a particular line of development.
    * NOTE: "git merge --no-ff branch_name_here" Merge the specified branch into the current branch, but always generate a merge commit (even if it was a fast-forward merge). This is useful for documenting all merges that occur in your repository.
    * NOTE: "git merge branch_name_here" Merge the specified branch into the current branch. Git will determine the merge algorithm automatically (discussed below).
    * NOTE: To merge a branch into another branch: first switch to the branch you want to merge into by doing "git checkout master", then do "git merge some_branch"
    * NOTE: To check out and merge a branch inn one-line: "git merge targetBranch new_branch" (aka: targetBranch <-- new_branch)
    * NOTE: To merge a remote branch into your local branch do: "git fetch origin master", "git checkout master", "git merge origin/master", if you get conflicts and you just want to keep all your or their updates you do "git checkout --thiers *" or "git checkout --ours *" and then add and commit and push. Now you have merged perfectly
    * NOTE: "git merge --abort" tries to revert back to your state before you ran the merge. The only cases where it may not be able to do this perfectly would be if you had unstashed, uncommitted changes in your working directory when you ran it, otherwise it should work fine.
    */
   static func merge(_ localRepoPath:String, _ intoBranch:String, _ fromBranch:String)->String{
       let shellScript:String = Git.path + Git.git + " " + Git.merge + " " + intoBranch + " " + fromBranch
       return ShellUtils.run(shellScript,localRepoPath)
   }
   /**
    * Checkout
    * PARAM: localRepoPath: path to the repository to operate on, must be absolute not relative
    * PARAM: loc: can be branch like: origin/master or master or some_feature, or --ours, --theirs can also be an commit id
    * PARAM: filePath: can be a relative file path, or the astrix sign for every file "*"
    * NOTE: When you switch between branches, the local files change accordingly
    * NOTE: to base a new branch of another branch do: "git checkout -b <new-branch> <existing-branch>"
    * NOTE: to create a new branch and switch to it do:"git checkout -b new-branch-name-here"
    * NOTE: "git checkout branch_name" is also a way to switch between your branches
    * NOTE: Checkout is a way to move back and forward in your code history. The git checkout command serves three distinct functions: checking out files, checking out commits, and checking out branches.
    * NOTE: git checkout works hand-in-hand with git branch. When you want to start a new feature, you create a branch with git branch, then check it out with git checkout. You can work on multiple features in a single repository by switching between them with git checkout
    * NOTE: To create a new branch adn start using it: "git branch new-feature" then "git checkout new-feature"
    * NOTE: git checkout <commit> <file> (checks out a spessific file from a spessific commit)
    * NOTE: git checkout <commit> (checks out all files from a spessific commit)
    * NOTE: git checkout HEAD hello.py (you can check out the most recent version with the following:)
    * NOTE: git checkout master hello.py (checks out a spessific file in a spessific branch)
    * NOTE: you can switch to a newly fetched branch with: "git checkout origin/master"
    * NOTE: after a merge you can use: "git checkout --thiers *" or "git checkout --ours *"
    */
	static func checkOut(_ localRepoPath:String, _ loc:String, _ filePath:String)->String{
		var shellScript:String = Git.path + Git.git + " " + Git.checkOut + " " +  loc
        if (filePath != " "){ shellScript  += " " + filePath }
//        Swift.print("checkOut.shellScript: " + "\(shellScript)")
		let retVal = ShellUtils.run(shellScript,localRepoPath)
//        Swift.print("checkOut.retVal: " + "\(retVal)")
        return retVal
	}
    /*
     * The opposite of the add action
     * "git reset"
     */
    static func revert(){
        //--complete this method
    }
    /*
     * --rm --remove files, research this
     */
    static func remove(){
        //--complete this method
    }
    /**
     * Clean
     * NOTE: git clean -n --Perform a "dry run" of git clean. This will show you which files are going to be removed without actually doing it.
     * NOTE: git clean -f --Remove untracked files from the current directory. The -f (force) flag is required unless the clean.requireForce configuration option is set to false (it's true by default). This will not remove untracked folders or files specified by .gitignore.
     * NOTE: git clean -f <path> --Remove untracked files, but limit the operation to the specified path.
     * NOTE: git clean -df --Remove untracked files and untracked directories from the current directory.
     * NOTE: git clean -xf --Remove untracked files from the current directory as well as any files that Git usually ignores.
     */
    static func clean(){
        //--complete this method
    }
    /**
     * branch
     * NOTE: to delete a branch do: "git branch -d some-branch" (if you just merged the branch in, if not use -D)
     * NOTE: to delete a branch from a remote repo: "git push origin --delete some_branch" Delete the specified branch. This is a �safe� operation in that Git prevents you from deleting the branch if it has unmerged changes.
     * NOTE: you can check which branches you have open by doing "git branch"
     * NOTE: Remote branches are just like local branches, except they represent commits from somebody else�s repository. You can check out a remote branch just like a local one, but this puts you in a detached HEAD state (just like checking out an old commit). You can think of them as read-only branches.
     * NOTE: you can inspect these branches with the usual git checkout and git log commands. If you approve the changes a remote branch contains, you can merge it into a local branch with a normal git merge.
     * NOTE: git branch -r
     * NOTE: git checkout -b new_branch_name_here (Create and check out <new-branch>. The -b option is a convenience flag that tells Git to run git branch <new-branch> before running )
     * NOTE: Delete your local feature branch: "git branch --delete <branch-name>"
     * # origin/master
     * # origin/develop
     * # origin/some-feature
     * TODO: ⚠️️ try this: "git branch branchname origin/branchname" -- this should make a local branch based of a remote branch
     */
    static func branch(_ targetBranch:String, _ deleteFlag:String){
        //--complete this method
    }
    /**
     * rebase
     * NOTE: it seems rebasing is almost the same as merging, but with rebasing you also get the opertunity to squash commits into fewer commits, so when the rebasing is complete, the commit history looks will look simpler than with merging.
     * NOTE: The golden rule of git rebase is to never use it on public branches.
     * NOTE: One of the best ways to incorporate rebasing into your workflow is to clean up local, in-progress features. By periodically performing an interactive rebase, you can make sure each commit in your feature is focused and meaningful. This lets you write your code without worrying about breaking it up into isolated commits�you can fix it up after the fact.
     * NOTE: you can also squash together commits without merging: "git checkout feature" then "git rebase -i HEAD~3" By specifying HEAD~3 as the new base, you�re not actually moving the branch�you�re just interactively re-writing the 3 commits that follow it. Note that this will not incorporate upstream changes into the feature branch.
     * NOTE: If you would prefer a clean, linear history free of unnecessary merge commits, you should reach for git rebase instead of git merge when integrating changes from another branch.
     * NOTE: you switch to the branch you want to rebase and then do "git rebase master"
     * TODO: ⚠️️ try "git rebase -i" see if it works as a commit squassher
     */
    static func rebase(){
        //--complete this method
    }
    /**
     * stash
     * NOTE: plain old `git stash` won't touch files that are untracked. For this, you need to use `git stash -u`
     * NOTE: stash vs branch merge: branch merge creates an extra commit, use stash when your in the middle of some unfinished feature and you need to pause it where it is
     * NOTE: stash vs branch rebase: the jury is still out, need more research into rebase, but it could resolve the extra commit problem
     * NOTE: use names for each stash: git stash save Major refactor of foo before interruption
     * NOTE: apply stash: git stash apply stash@{1}
     * NOTE: applies the latest stash and removes it: git stash pop
     * NOTE: remove stashes: stash drop stash@{1}
     * NOTE: list all stashes: git stash list
     * NOTE: stash also removes all files in your directory as if you just did a "git reset --hard"
     * NOTE: when you apply your stash again, you may get file conflicts, resolve this as you would resolve a branch merge
     * TODO: ⚠️️ test if you can use theirs and ours as you would in a regular merge
     * TODO: ⚠️️ create 2 methods for stash, stash and stash_by_id, stash_at
     */
    static func stash(_ title:String){
        //--TODO: if no title is provided store the stash without title: by not including the save syntax
        //--"git stash -u save " + title
    }
    /**
     * Config
     * NOTE: set your name: git config --global user.name "your-user-name"
     * NOTE: set your email: git config --global user.email youEXAMPLE:.com
     * NOTE: git config --global core.editor "vi", or use nano or atom, see gitsync on github in the wiki: dev tips
     */
    static func config(){
        //--complete this method
    }
    /**
     * NOTE: git remote -v (List the remote connections you have to other repositories. include the URL of each connection.)
     * NOTE: git remote add <name> <url> (Create a new connection to a remote repository. After adding a remote, you�ll be able to use <name> as a shortcut)
     * NOTE: git remote rm <name> (Remove the connection to the remote repository called <name>.)
     * NOTE: git remote rename <old-name> <new-name> (Rename a remote connection from <old-name> to <new-name>.)
     */
    static func remote(){
        //--complete this method
    }
}

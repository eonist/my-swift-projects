/*
 * git diff --name-only --diff-filter=U "outputs: text2.txt"
 * git status -s "outputs UU text2.txt"
 */
on unmergedFiles(localPath)
	set unmergedPaths to diff(localPath, "--name-only --diff-filter=U")
	return paragraphs of unmergedPaths
end unmerged_files
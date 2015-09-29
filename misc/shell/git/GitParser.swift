/*
 * git diff --name-only --diff-filter=U "outputs: text2.txt"
 * git status -s "outputs UU text2.txt"
 */
func unMergedFiles(localPath){
	var unmergedPaths = diff(localPath, "--name-only --diff-filter=U")
	return paragraphs of unmergedPaths//// :TODO: use some sort of linesToArray method here
}
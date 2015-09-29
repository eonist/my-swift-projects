/*
 * Asserts if there are unmerged paths that needs resolvment
 */
func hasUnMergePaths(localPath)->Boolean{
	//log length of GitParser's unmerged_files(local_path)
	return GitParser.unmergedFiles(localPath).count > 0
}
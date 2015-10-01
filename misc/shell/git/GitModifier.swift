/**
 * checkout
 */
func check_out(local_repo_path, loc, file_path){
	//log ("GitModifier's check_out(" & loc & " " & file_path & ")")
	var shell_cmd to "cd " + local_repo_path + ";" + git_path + "git checkout " + loc
	if file_path != " "{
		var shell_cmd = shell_cmd + " " + file_path
	}
	//--log "shell_cmd: " & shell_cmd
	ShellUtils.run(shell_cmd)
}
import Foundation
class ShellUtils{
	/**
	 * NOTE: a shell library in swift: https://github.com/kareman/SwiftShell
	 * NOTE: you can do: NSAppleScript(source: "do shell script \"sudo whatever\" with administrator " +"privileges")!.executeAndReturnError(nil)
	 * TODO: add some explination about what happens here, line for line
	 * Example: print(shell("git log --oneline").output)
	 */
	class func run(input: String) -> (output: String, exitCode: Int32) {
        /*
        Was this: (but Swift doesnt use spit anymore, may need further research)
        let arguments = split(input, maxSplit: Int.max, allowEmptySlices: true) {
            $0 == " "
        }
        */
        
        let arguments = input.componentsSeparatedByString(" ")
	    
	    let task = NSTask()
	    task.launchPath = "/usr/bin/env"
	    task.arguments = arguments
	    task.environment = [
	        "LC_ALL" : "en_US.UTF-8",
	        "HOME" : NSHomeDirectory()
	    ]
	    let pipe = NSPipe()
	    task.standardOutput = pipe
	    task.launch()
	    task.waitUntilExit()
	    let data = pipe.fileHandleForReading.readDataToEndOfFile()
	    let output: String = NSString(data: data, encoding: NSUTF8StringEncoding) as! String
	    return (output, task.terminationStatus)
	}
}
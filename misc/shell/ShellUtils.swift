import Foundation
class ShellUtils{
    enum ShellError: ErrorType {
        case success,failure
    }
	/**
	 * NOTE: a shell library in swift: https://github.com/kareman/SwiftShell
	 * NOTE: you can do: NSAppleScript(source: "do shell script \"sudo whatever\" with administrator " +"privileges")!.executeAndReturnError(nil)
	 * TODO: add some explination about what happens here, line for line
	 * Example: ShellUtils.run("git log --oneline")
     * IMPORTANT: spaces that is not intended to split arguments must be encoded before use (blank space -> %20)
	 */
    class func run(input: String, _ cd:String = "") /*throws*/ -> String {
        let (output, terminationStatus) = ShellUtils.exc(input,cd)
        terminationStatus
        //Swift.print("terminationStatus: " + "\(terminationStatus)")
        return output
    }
    /**
     * Example: ShellUtils.exc("git log --oneline").output
     */
    class func exc(input: String, _ cd:String = "") -> (output:String, exitCode:Int32){
        var arguments = input.componentsSeparatedByString(" ")//<--you can also use split here
        //Swift.print("arguments.count: " + "\(arguments.count)")
        arguments = arguments.map {$0.encode()!.decode()!}/*<--the encode part was necessary to allow % chars*/
        //arguments.forEach{Swift.print("$0: " + "\($0)")}
        let task = NSTask()
        task.currentDirectoryPath = cd
        task.launchPath = "/usr/bin/env"
        task.arguments = arguments
        task.environment = ["LC_ALL" : "en_US.UTF-8","HOME" : NSHomeDirectory()]
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*///TODO:may need to call this before launch() ???
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output:String = NSString(data:data, encoding:NSUTF8StringEncoding) as! String
        return (output, task.terminationStatus)
    }
    /**
     * new
     * NOTE: supports piping
     * CAUTION: use this method for hard coded commands, not for commands that the user can insert data
     */
    class func unsafeRun(input: String, _ cd:String = "") -> String {
        let (output, terminationStatus) = ShellUtils.unsafeExc(input,cd)
        terminationStatus
        return output
    }
    /**
     * new
     * NOTE: supports piping
     */
    class func unsafeExc(input: String, _ cd:String = "") -> (output:String, exitCode:Int32){
        let task = NSTask()
        task.currentDirectoryPath = cd
        task.launchPath = "/bin/sh"/*setting shell as launchPath enables piping support*/ //--> /bin/bash should also work
        task.arguments = ["-c",input]/*I think the -c part enables auto path resolvment and support for piping etc*/
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*/
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output:String = NSString(data:data, encoding:NSUTF8StringEncoding) as! String
        return (output, task.terminationStatus)
    }
}
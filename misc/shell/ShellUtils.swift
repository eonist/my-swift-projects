import Foundation
class ShellUtils{
    enum ShellError: Error {
        case success,failure
    }
	/**
	 * NOTE: a shell library in swift: https://github.com/kareman/SwiftShell
	 * NOTE: you can do: NSAppleScript(source: "do shell script \"sudo whatever\" with administrator " +"privileges")!.executeAndReturnError(nil)
	 * TODO: add some explination about what happens here, line for line
	 * IMPORTANT: spaces that is not intended to split arguments must be encoded before use (blank space -> %20)
     * EXAMPLE: ShellUtils.run("git log --oneline")
     * EXAMPLE: ShellUtils.run("git version",FilePathParser.userHomePath())//git version 2.5.4 (Apple Git-61)
	 */
    static func run(_ input: String, _ cd:String = "") /*throws*/ -> String {
        let (output, terminationStatus) = ShellUtils.exc(input,cd)
        _ = terminationStatus
        //Swift.print("terminationStatus: " + "\(terminationStatus)")
        return output
    }
    /**
     * Example: ShellUtils.exc("git log --oneline").output
     */
    static func exc(_ input: String, _ cd:String = "") -> (output:String, exitCode:Int32){
        var arguments = input.components(separatedBy: " ")//<--you can also use split here
        //Swift.print("arguments.count: " + "\(arguments.count)")
        arguments = arguments.map {$0.encode()!.decode()!}/*<--the encode part was necessary to allow % chars*/
        //arguments.forEach{Swift.print("$0: " + "\($0)")}
        let task = Process()
        task.currentDirectoryPath = cd
        task.launchPath = "/usr/bin/env"
        task.arguments = arguments
        task.environment = ["LC_ALL" : "en_US.UTF-8","HOME" : NSHomeDirectory()]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*///TODO:may need to call this before launch() ???
        let data = pipe.fileHandleForReading.readDataToEndOfFile()/*retrive the date from the nstask output*/
        let output:String = NSString(data:data, encoding:String.Encoding.utf8.rawValue) as! String/*decode the date to a string*/
        return (output, task.terminationStatus)
    }
    /**
     * BETA
     * NOTE: supports piping
     * CAUTION: use this method for hard coded commands, not for commands that the user can insert data
     */
    static func unsafeRun(_ input: String, _ cd:String = "") -> String {
        let (output, terminationStatus) = ShellUtils.unsafeExc(input,cd)
        _ = terminationStatus
        return output
    }
    /**
     * BETA
     * NOTE: supports piping
     */
    static func unsafeExc(_ input: String, _ cd:String = "") -> (output:String, exitCode:Int32){
        let task = Process()
        task.currentDirectoryPath = cd
        task.launchPath = "/bin/sh"/*Setting shell as launchPath enables piping support*/ //--> /bin/bash should also work
        task.arguments = ["-c",input]/*I think the -c part enables auto path resolvment and support for piping etc*/
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*/
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output:String = NSString(data:data, encoding:String.Encoding.utf8.rawValue) as! String
        return (output, task.terminationStatus)
    }
}

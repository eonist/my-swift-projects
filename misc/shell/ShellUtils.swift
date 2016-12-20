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
        arguments.forEach{Swift.print("$0: " + "\($0)")}
        let task = NSTask()
        task.currentDirectoryPath = cd
        task.launchPath = "/usr/bin/env"
        task.arguments = arguments
        task.environment = ["LC_ALL" : "en_US.UTF-8","HOME" : NSHomeDirectory()]
        let pipe = NSPipe()
        task.standardOutput = pipe
        task.launch()
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*/
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output:String = NSString(data:data, encoding:NSUTF8StringEncoding) as! String
        return (output, task.terminationStatus)
    }
}
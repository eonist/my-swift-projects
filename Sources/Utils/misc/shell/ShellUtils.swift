import Foundation
class ShellUtils{
    enum ShellError: Error {
        case success,failure
    }
	/**
	 * NOTE: a shell library in swift: https://github.com/kareman/SwiftShell
	 * NOTE: you can do: NSAppleScript(source: "do shell script \"sudo whatever\" with administrator " +"privileges")!.executeAndReturnError(nil)
	 * TODO: add some explination about what happens here, line for line
	 * IMPORTANT: ⚠️️ spaces that is not intended to split arguments must be encoded before use (blank space -> %20)
     * EXAMPLE: ShellUtils.run("git log --oneline")
     * EXAMPLE: ShellUtils.run("git version",FilePathParser.userHomePath())//git version 2.5.4 (Apple Git-61)
	 */
    static func run(_ input: String, _ cd:String = "") /*throws*/ -> String {
        let (output, terminationStatus) = ShellUtils.exc(input,cd)
        _ = terminationStatus
//        Swift.print("terminationStatus: " + "\(terminationStatus)")
        return output
    }
    /**
     * Example: ShellUtils.exc("git log --oneline").output
     * IMPORTANT: ⚠️️ if input has spaces and the space are not seperators of arguments, then you must encode it first: "".encode()!
     * IMPORTANT: ⚠️️ if your input contains % char, then it must be encoded first -> you can encode parts of strings etc to create the correct input
     */
    static func exc(_ input: String, _ cd:String = "") -> (output:String, exitCode:Int32){
//        Swift.print("🚪⬅️️exc start. input: " + "\(input) cd: \(cd)")
        var arguments = input.components(separatedBy: " ")//<--you can also use split here
//        Swift.print("arguments.count: " + "\(arguments.count)")
        //TODO: This line bellow was $0.encode().decode() to allow % chars, But if your input is already encoded to support space, then you get double encoded content.
        arguments = arguments.map {$0.decode()!}
        //Swift.print("block of interest start")
//      arguments.forEach{Swift.print("$0: >\($0)<")}
        //Swift.print("block of interest end")
        let task = Process()
//        Swift.print("Process(): ")
        task.currentDirectoryPath = cd
        task.launchPath = "/usr/bin/env"
        task.arguments = arguments
        task.environment = ["LC_ALL" : "en_US.UTF-8","HOME" : NSHomeDirectory()]
//        Swift.print("Pipe()")
        let pipe = Pipe()
        task.standardOutput = pipe
        /*Error*/
        let errpipe = Pipe()
        task.standardError = errpipe
        task.launch()
//        Swift.print("task.launch()")
        
//
        let data = pipe.fileHandleForReading.readDataToEndOfFile()/*retrive the date from the nstask output, only supports small outputs*/
        let output:String = NSString(data:data, encoding:String.Encoding.utf8.rawValue)! as String/*decode the date to a string*/
        
//        let output:String = {
//            var sequentialOutput:String = ""
//            while (true) {
//                let data = pipe.fileHandleForReading.readData(ofLength: 1024)//enables reading big outputs.
//                if data.count <= 0 { break }//breaks out of the while loop
//                let str = String(data: data, encoding: String.Encoding.utf8)!
//                sequentialOutput += str
////                Swift.print("sequentialOutput: " + "\(sequentialOutput)")
//            }
//            return sequentialOutput
//        }()
//        Swift.print("wait")
        //⚠️️ might be a fluke, but it did hang 1 time after moving waitUntilExit bellow the output code ⚠️️
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*///TODO:may need to call this before launch() 🚫???
        /*Error*/
        let errdata = errpipe.fileHandleForReading.readDataToEndOfFile()
        let errorStr:String = NSString(data:errdata, encoding:String.Encoding.utf8.rawValue)! as String
        _ = errorStr
//        Swift.print("errorStr: " + "\(errorStr)")
//        Swift.print("🚪➡️️exe end")
//        Swift.print("output: " + "\(output)")
//        Swift.print("task.terminationStatus: " + "\(task.terminationStatus)")
//        Swift.print("exit")
        return (output, task.terminationStatus)
    }
}
extension ShellUtils{/*BETA*/
    /**
     * BETA
     * NOTE: ⚠️️ supports piping ⚠️️
     * CAUTION: ⚠️️ use this method for hard coded commands, not for commands that the user can insert data ⚠️️
     */
    static func unsafeRun(_ input: String, _ cd:String = "") -> String {
        let (output, terminationStatus) = ShellUtils.unsafeExc(input,cd)
        //Swift.print("terminationStatus: " + "\(terminationStatus)")
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
        //TODO: ⚠️️ moving waitUntilExit bellow output retrieval could enable bigger outputs. Aka big outputs may never complete if its not bellow. ⚠️️
        task.waitUntilExit()/*Makes sure it finishes before proceeding. If the task can be asynchronous, you can remove that call and just let the NSTask do it's thing.*/
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output:String = NSString(data:data, encoding:String.Encoding.utf8.rawValue)! as String
        return (output, task.terminationStatus)
    }
}

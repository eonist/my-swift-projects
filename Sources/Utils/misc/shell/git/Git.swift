import Foundation

/**
 * NOTE: was /usr/local/git/bin/ but that was a fix for an early 🐛
 */
class Git {
    static var path:String = "/usr/bin/"/*To execute git commands we need to call the git commands from this path*/
    /**/
    static var git:String = "git"
    static var add:String = "add"
    static var commit:String = "commit"
    static var reset:String = "reset"
    static var pull:String = "pull"
    static var push:String = "push"
    static var initiate:String = "init"
    static var rm:String = "rm"
    static var origin:String = "origin"
    static var remote:String = "remote"
    static var clone:String = "clone"
    static var update:String = "update"
    static var fetch:String = "fetch"
    static var checkOut:String = "checkout"
    static var merge:String = "merge"
    /**/
    static var log:String = "log"
    static var status:String = "status"
}

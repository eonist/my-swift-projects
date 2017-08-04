import Foundation

/**
 * NOTE: Was /usr/local/git/bin/ but that was a fix for an early 🐛
 */
enum Git {
    static let path:String = "/usr/bin/"/*To execute git commands we need to call the git commands from this path*/
    /**/
    static let git:String = "git"
    /*Modifier*/
    static let add:String = "add"
    static let commit:String = "commit"
    static let reset:String = "reset"
    static let pull:String = "pull"
    static let push:String = "push"
    static let initiate:String = "init"
    static let rm:String = "rm"
    static let origin:String = "origin"
    static let remote:String = "remote"
    static let clone:String = "clone"
    static let update:String = "update"
    static let fetch:String = "fetch"
    static let checkOut:String = "checkout"
    static let merge:String = "merge"
    /*Parsing*/
    static let log:String = "log"
    static let status:String = "status"
    static let show:String = "show"
    static let config:String = "config"
    static let cherry:String = "cherry"
    static let diff:String = "diff"
}

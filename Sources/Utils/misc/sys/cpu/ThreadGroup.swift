import Foundation

class ThreadGroup {
    typealias CompletionHandler = ()->Void
    private var index:Int = 0
    private var allComplete:CompletionHandler
    private var count:Int
    init(_ count:Int,onAllComplete:@escaping CompletionHandler){
        self.count = count
        self.allComplete = onAllComplete
    }
    func onComplete(){
        index += 1
        //Swift.print("refreshRepo.onComplete() i: \(idx)")
        if index == 12 {
            allComplete()
        }
//        allComplete()//execute the closure
    }
}
//let repos = RepoUtils.repoListFlattenedOverridden/*creates array from xml or cache*/
//var idx:Int = 0
//func onComplete(){/*TODO: ⚠️️ You can probably use DispatchGroup here aswell. but in the spirit of moving on*/
//    
//}
//repos.forEach { repo in
//    RefreshUtils.refreshRepo(self.commitDP!,repo,onComplete)//🚪⬅️️ 🚧 0~1000's of a-sync 💼->🐚->🌵 calls
//}

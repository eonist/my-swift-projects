import Foundation

class ThreadGroup {
    typealias CompletionHandler = ()->Void
    var index:Int = 0
    init(onComplete:CompletionHandler, onAllComplete:CompletionHandler){
        
    }
}
let repos = RepoUtils.repoListFlattenedOverridden/*creates array from xml or cache*/
var idx:Int = 0
func onComplete(){/*TODO: ⚠️️ You can probably use DispatchGroup here aswell. but in the spirit of moving on*/
    idx += 1
    //Swift.print("refreshRepo.onComplete() i: \(idx)")
    if idx == repos.count {
        allRefreshesCompleted()
    }
}
repos.forEach { repo in
    RefreshUtils.refreshRepo(self.commitDP!,repo,onComplete)//🚪⬅️️ 🚧 0~1000's of a-sync 💼->🐚->🌵 calls
}

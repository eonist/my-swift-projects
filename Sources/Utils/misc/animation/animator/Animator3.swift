import Foundation


/*
 //it would be cool to have background thread support
 //if you need to stop the entire anim chain you need to store each successive anim in an array and stop the one that is running, you can create utilitity methods that does this for you
 //Later you can maybe create a class that is called AnimSeq, which can sequence anim from a json file, akin to your legacy project
 
 let anim1 = Anim(dur:2.75,from:0,to:1) {
    //onFrame anim here, move X forward
 }.pause(at:1.25,for:2){//pauses the anim for a little bit
    //do some things, fetch data etc
 }.completed = Anim(dur:1.5,from:1,to:0){//adds a new anim block to the completed callBack
    //onFrame anim here, move x back
 }.completed = {
    //
 }
 anim1.start()//initiates the animation chain
 
 
 */
class Animator3 {
    init(){
        
    }
    func onComplete() -> Void {
        
    }
    func start() -> Void {
        
    }
    func pause(durInSec:CGFloat) -> Void {
        
    }
}

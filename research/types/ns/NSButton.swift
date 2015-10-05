let button = NSButton()
   button.target = self
   button.action = "myAction:"

//The above specifies callback on 'self' to be the function

func myAction(obj:AnyObject?){
   print("press")
      if let btn = obj as? NSButton{
           print(btn.title)
      }
   
}
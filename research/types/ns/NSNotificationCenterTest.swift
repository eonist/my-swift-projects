import Foundation
import Cocoa

class Test{
    func testing(){
        // Add an observer that will respond to loginComplete
        NSNotificationCenter.defaultCenter().addObserver(self,selector:"showMainMenu", name:"loginComplete", object:nil)
        
        // Post a notification to loginComplete
        NSNotificationCenter.defaultCenter().postNotificationName("loginComplete",object:self)
    }
   
    // the function specified in the same class where we defined the addObserver
    func showMainMenu(notification:NSNotification) {
        print("Received Notification - Someone seems to have logged in" + String(notification.object.self))
    }
}

//http://nshipster.com/nsnotification-and-nsnotificationcenter/

/*
Maybe you can use NSNotificationCenter this way:

1. list contains many lables

2. many lables ar added to a container within List

3. each lable fires of a notificatio  with "a unique notificationid for lable" and object set to the imidiate parent of the lable or maybe superview. 

4. then in the list we add observer to listen for the unique event type, with an obj that equals self

TODO: read about the object in nsnotifactioncenter

NOTE: or you could set the object to self and let the observer determine if it is a child or not

Note: set it to self and then have the observer determine if its a child via a static method that walks up the view hirarchy

a propsal for 

isChild(parent:NSView,child:NSChild){
	loop up the view hirarchy until parent === child.superview then return true
	else return false
}

*/

//Is there a simple way to walk back up the NSView hierarchy (superview of superview of superview of nsview) to the main window or a point in between?




/*
NSView *aView = myView;
while ((aView = [aView superview])) {
NSLog(@"%@", aView);
}
*/
//to get the window of a view :
//view.window





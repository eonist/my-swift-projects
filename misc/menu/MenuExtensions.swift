import Cocoa

extension NSMenu {
    /**
     *
     */
    func addMenuItem(newItem:NSMenuItem)->NSMenuItem{
        addItem(newItem)
        return newItem
    }
    /**
     *
     */
    func addSubMenu(){
        //add later
    }
}

import Foundation

class AdvanceArrayParser {
    /**
     * Returns the branch at @param index
     * @Note this function is recursive
     * @Note to find the children of the root use an empty array as the index value
     */
    class func childAt<T>(children:Array<T>,_ index:Array<Int>)->[T]?{
        if(index.count == 0 && children.count >= 1){return children}/*returns the root*/
        else if(index.count == 1 && children.count >= index[0]){return [children[index[0]]]}/*returns a branch, packaged as a branch*/
        else if(index.count > 1 && children.count > 0) {
            return AdvanceArrayParser.childAt(children[index[0]] as! Array<T>,index.slice(1,index.count))
        }
        return nil
    }
}

/*
if(index.length == 0 && xml != null) return xml;
else if(index.length == 1 && xml != null && xml.children()[index[0]] != null) return xml.children()[index];// :TODO: if index.length is 1 you can just ref index
else if(index.length > 1 && xml.children().length() > 0) return childAt(xml.children()[index[0]],index.slice(1,index.length));
return null;

*/
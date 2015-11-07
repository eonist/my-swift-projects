import Foundation

public class RegExpModifier{
    /**
     * @param input: a Css String such as "P{color:#00FF00;}"
     * @return a Comment free css string
     */
    class func removeComments(string:String)->String {
        let pattern:String = "\\/\\*.*?\\*\\/";
        let output:String = RegExp.replace(string,pattern, "")
        //print(input.match(regExpPattern));
        return output;
    }
}
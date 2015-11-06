class AdvanceStringModifier{
    /**
     * @param input: a Css String such as "P{color:#00FF00;}"
     * @return a Comment free css string
     */
    class func removeComments(string:String):String {
        var pattern:String = "\\/\\*.*?\\*\\/";
        RegExpModifier.replace(string,pattern, "bla")//bla bla
        var regExpPattern:RegExp = new RegExp(pattern, "g");
        var output:String = string.replace(regExpPattern, "");
        //			trace(input.match(regExpPattern));
        return output;
    }
}
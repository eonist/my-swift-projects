import Foundation

public class RegExpParser{
    /**
     * Returns a file path, excluding the file name and file-suffix
     * @param input: usually formated like: /Users/James/Downloads/PanelView.png
     * @return a string formatted like: /Users/James/Downloads/
     * @Example path(file://Users/User/Desktop/main.css);//file://Users/User/Desktop/
     * @Note you can also do this another way:
     * var match : Array = input.split(".");
     * var path:String = String(match[0]).substring(0, String(match[0]).lastIndexOf("/"));
     */
    class func path(url:String)->String {
        return url.match("^.*?\\/(?=\\w*?\\.\\w*?$)")[0]
    }
    /**
     *
     */
    class func fileName(url:String)->String {
        return url.match("^.*?\\/(\\w*?\\.\\w*?$)")[1]
    }
}
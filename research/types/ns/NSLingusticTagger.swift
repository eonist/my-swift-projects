import Foundation

/*
NSLinguisticTagger
Available from iOS 5.0

If you're looking to parse natural language entered by a user, you're looking for NSLinguisticTagger: it automatically recognises English words (and words in other languages too, if you ask) and tells you what kind of word it is. That is, this magic little class distinguishes between verbs, nouns, adjectives and so on, so you can focus on the important stuff: how do I (verb) this (noun)?

Here's an example to get you started:
*/
/**
*
*/
func testing(){
    let options = NSLinguisticTaggerOptions.OmitWhitespace.rawValue | NSLinguisticTaggerOptions.JoinNames.rawValue
    let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemesForLanguage("en"), options: Int(options))
    
    let inputString = "This is a very long test for you to try"
    tagger.string = inputString
    
    let range = NSMakeRange(0, inputString.characters.count)
    tagger.enumerateTagsInRange(range, scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass, options: NSLinguisticTaggerOptions(rawValue: options)) { tag, tokenRange, sentenceRange, stop in
        let token = (inputString as NSString).substringWithRange(tokenRange)
        print("\(tag): \(token)")
    }
    /*
    When you loop through the matches found by an NSLinguisticTagger, you get back an NSRange describing where in the string each item was found. This is a bit ugly because the Swift way is to use string indexes, so you need to cast the Swift string to an NSString.
    
    If you want to make things slightly nicer, add this helper function:
    */
    
    /*

    //needs work: 

    func rangeFromNSRange(nsRange: NSRange, forString str: String) -> Range<String.Index>? {
        if let from = String.Index(str.utf16.startIndex + nsRange.location, within: str),
            let to = String.Index(str.utf16.startIndex + nsRange.location + nsRange.length, within: str) {
                return from ..< to
        }
        
        return nil
    }
    
    //With that in place you can now pull out the token like this:
    
    let token = inputString.substringWithRange(rangeFromNSRange(tokenRange, forString: inputString)!)
    
    */
}

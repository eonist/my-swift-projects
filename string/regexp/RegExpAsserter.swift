//import RegExpParser.swift
/*
 * Asserts if a match exists 
 * NOTE: NSRegularExpression. https://developer.apple.com/library/mac/documentation/Foundation/Reference/NSRegularExpression_Class/index.html
 */
func test(text: String!, pattern: String!, options:Array = [])->Boolean{
	return RegExpParser.match(textpattern,options).count > 0
}
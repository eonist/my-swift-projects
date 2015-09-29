//import RegExpParser.swift
/*
 * Asserts if a match exists 
 */
func test(text: String!, pattern: String!, options:Array = [])->Boolean{
	return RegExpParser.match(textpattern,options).count > 0
}
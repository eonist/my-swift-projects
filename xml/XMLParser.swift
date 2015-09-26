/*
 * Returns the value of xmlItem (XML item)
 * remember to cast the returned value to the excpected type (i.e: as string)
 */
func xmlValue(xmlItem)->String{//TODO: could be renamed to value
	return value of xml_item
}
/*
 * Returns the name of xmlItem (XML item)
 */
func xmlName(xmlItem:XML)->String{//TODO: could be renamed to name
	return name of xmlItem
}
/*
 * Returns an XML item at an index
 */
func element(xmlItem:XML, index:Int)->XML{
	return XML element index of xmlItem
}
/*
 * Returns the value of the first element that has the name of theName
 * TODO: possibly move to AdvanceXMLParser
 */
func element(xmlData:XML, elementName:String)->XML{
	repeat with i from 1 to count of XML elements of xmlData
		set e_name to (get name of XML element i of xmlData) as Unicode text
		if e_name is equal to elementName then
			//display dialog "found a match"
			return value of XML element i of xmlData
		else
			my element(XML element i of xml_data, elementName)//is it recursive?
		end if //bug fix
	end repeat
}
/*
 * Returns the first element that has an attribute matching (key and value pair)
 */
func element(xmlData:XML, attrKey:String, attrVal:String)->XML{
	repeat with i from 1 to count of XML elements of xml_data
		set elm to XML element i in xml_data
		set val to my attributeValue(elm, attrKey)
		if val = (attrVal as string) then
			return elm
		end if
	end repeat
	return nil
}
/*
 * Returns the root of the xml
 * @param xml_file the path to the xml file like: "Macintosh HD:Users:Admin:Desktop:colors.xml"  in HSF not POSIX
 * @Example: XMLParser.root(((path to desktop) as string) & "colors.xml")
 * @Note: You must keep using XMLParser to gain further access to xml elements, since it relies on the System events
 */
func root(xmlFile:XML)->XML {
	var xmlData:XML = contents of XML file xmlFile
	return XML element 1 of xmlData
}
/*
 * Returns every XML element in xmlElement
 * @Note: log length of XMLParser's every_element(theXMLRoot)--returns number of children in the xml root
 */
func everyElement(xmlElement:XML) ->Array{
	//return every XML element of xml_element
}
/*
 * Returns an XML item attribute at index (use name of, value of)
 * Remember to use attributeValue() to obrain the value
 * @Param index: index of the element in he xml
 */
func attribute(xmlItem:XML, index:Int)->Any{//tuple or an attr struct maybe?
	return XML attribute index of xml_item
}
/*
 * Returns the first attribute with theName
 * retrive name and value from the attribute, remember to cast as string
 * TODO rename to attributeByKey?!?
 */
func attribute(xmlData:String, attrKey:String) -> String{
	return first XML attribute of xmlData whose name is attrKey
}
/*
 * Returns the value of the attribute at xml item index 
 */
func attributeValue(xmlItem:XML, indexOfElement:Int)->String{
	set attr to attribute(xmlItem, indexOfElement) //the_index was 1
	return attributeValue(attr)
}
/*
 * Returns the value of the first attribute with attributeName
 * Consider renaming to attributeValueByKey
 */
func attributeValue(xmlElement:XML, attrKey:String)->String{
	//log ("attributeName" & attributeName)
	set attr to attribute(xmlElement, attrKey)
	//log (theAttribute)
	return attributeValue(attr)
}
/*
 * Returns a value of an attribute
 */
func attributeValue(attribute:Any)->String{
	return value of attribute
}
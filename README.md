# swift-utils
Generic swift utilities


**XMLParser**. 

```swift
//To read xml:
let xml:String = <media><book>The shining</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
XMLParser.data(xml)["content"]["media"][0]["content"]["book"][0]["content"] //Output: The shining
XMLParser.data(xml)["content"]["media"][0]["content"]["music"][0]["attributes"]["type"] //Output: digital

//To create xml:
XMLParser.xml(data)//Output: an xml string
```


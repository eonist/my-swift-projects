# swift-utils
Generic swift utilities


XMLParser:

```swift
import XMLParser.swift
let xml:String = <media><book>The shinning</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
XMLParser.data(xml)["content"]["media"][0]["content"]["book"][0]["content"] //Output: The shinning


```


# swift-utils
Generic swift utilities


XMLParser:

```swift
import XMLParser.swift
let xml:String = <media><book>Killing a mocking bird</book><music type="digital">Mozzart</music><media>

XMLParser.data(xml)["content"]["media"][0]["content"]["book"][0]["content"] //Output: Killing a mocking bird


```


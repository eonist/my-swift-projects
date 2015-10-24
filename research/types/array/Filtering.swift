// Filter an array of strings down to only strings that begin with the word
// "Apple"
let array = ["Orange", "Apple", "Apple Juice"]
let filteredArray = array.filter() {
    return $0.hasPrefix("Apple")
}
// filteredArray now contains "Apple", "Apple Juice"

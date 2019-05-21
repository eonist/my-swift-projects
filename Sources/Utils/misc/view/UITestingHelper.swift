class UITestingHelper {
    /**
     * ⚠️️ beta ⚠️️
     * ## Example:
     * hittableElements(query: XCUIApplication().descendants(matching: .any)).count // n
     */
    func hittableElements(query: XCUIElementQuery) -> [XCUIElement] {
        return (0..<query.count).indices.map { i in
            let element = query.children(matching: .other).element(boundBy: i)
            return element.isHittable ? element : nil
        }.compactMap { $0 }
    }
}

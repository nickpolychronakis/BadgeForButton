import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BadgeForButtonTests.allTests),
    ]
}
#endif

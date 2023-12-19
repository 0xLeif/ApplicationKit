import XCTest
@testable import ApplicationKit

final class RunOnceTests: XCTestCase {
    func testRunOnceRunsOnce() throws {
        for i in 0 ..< 10 {
            Application.runOnce {
                if i > 0 {
                    XCTFail()
                }
            }
        }
    }
}

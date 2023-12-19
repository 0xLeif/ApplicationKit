import XCTest
@testable import ApplicationKit

private class MyApplication: LifecyleApplication {
    override var lifecycleNotifications: [LifecyleNotification] {
        super.lifecycleNotifications + [
            // Your notitifications
        ]
    }

    override func didBecomeActiveNotification(notification: Notification) {
        // Your implementation
    }
}

final class LifecyleApplicationTests: XCTestCase {
    func testLifecyleApplication() throws {
        Application.promote(to: MyApplication.self)
    }
}

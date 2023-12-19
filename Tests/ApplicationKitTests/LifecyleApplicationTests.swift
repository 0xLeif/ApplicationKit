import XCTest
@testable import ApplicationKit

private class MyApplication: LifecyleApplication {

    override var lifecycleNotifications: [LifecyleApplication.LifecyleNotification] {
        super.lifecycleNotifications + [
            // Your notitifications
        ]
    }

    override func didBecomeActiveNotification(notification: Notification) {
        
    }
}

final class LifecyleApplicationTests: XCTestCase {
    func testLifecyleApplication() throws {
        Application.promote(to: MyApplication.self)
    }
}

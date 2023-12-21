import AppState
import XCTest
import CoreLocation
@testable import ApplicationKit

class MockLocationManager: LocationManager {

}

class MyLocationApplication: LocationApplication {

}

final class LocationApplicationTests: XCTestCase {
    var mockLocationManager: MockLocationManager? {
        Application.dependency(\.locationManager) as? MockLocationManager
    }

    func testLocationApplication() throws {
        let locationManagerOverride = Application.override(\.locationManager, with: MockLocationManager())

        let locationManager = try XCTUnwrap(mockLocationManager)

        XCTAssertNil(locationManager.delegate)

        Application.promote(to: MyLocationApplication.self)

        XCTAssertNotNil(locationManager.delegate)
        XCTAssertTrue(locationManager.delegate is MyLocationApplication)

        locationManagerOverride.cancel()

        XCTAssertNotNil(locationManager.delegate)
        XCTAssertTrue(locationManager.delegate is MyLocationApplication)
        XCTAssertFalse(Application.dependency(\.locationManager) is MockLocationManager)
    }
}

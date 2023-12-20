import AppState
import XCTest
import CoreLocation
@testable import ApplicationKit

class MockLocationManager: LocationManager {
    func test() {
        delegate?.locationManager?(.init(), didEnterRegion: .init())
    }
}

class MyLocationApplication: LocationApplication {
    override func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion: \(region)")
    }
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

        mockLocationManager?.test()

        locationManagerOverride.cancel()

        XCTAssertNotNil(locationManager.delegate)
        XCTAssertTrue(locationManager.delegate is MyLocationApplication)
        XCTAssertFalse(Application.dependency(\.locationManager) is MockLocationManager)
    }
}

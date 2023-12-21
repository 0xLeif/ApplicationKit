import AppState
import CoreLocation

public extension Application {
    /// An instance of `CLLocationManager` from the CoreLocation framework, which is used for handling the location data in iOS applications.
    var locationManager: Dependency<LocationManager> {
        dependency(LocationManager())
    }
}

/// LocationApplication is a subclass of AppState's Application that conforms to the  CLLocationManagerDelegate protocol. This allows it to handle location updates from CLLocationManager. LocationApplication is designed to be subclassed and it primarily functions to register itself as the delegate for the Application dependency locationManager. However, it doesn't carry out any other tasks by default. This means that you will need to start any updating, for example `startUpdatingLocation`.
open class LocationApplication: LifecyleApplication, CLLocationManagerDelegate {
    public required init() {
        super.init()

        Application.dependency(\.locationManager).delegate = self
    }

    // MARK: - Open CLLocationManagerDelegate Functions

    #if os(iOS) || os(macOS)
    open func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) { }
    open func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) { }
    open func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) { }
    open func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) { }
    open func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) { }
    open func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) { }
    open func locationManager(_ manager: CLLocationManager, didFailRangingFor beaconConstraint: CLBeaconIdentityConstraint, error: Error) { }
    open func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) { }
    open func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) { }
    open func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) { }
    open func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) { }
    #endif

    #if !os(tvOS)
    open func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool { false }
    #endif

    open func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { }
    open func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) { }
    open func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) { }
}

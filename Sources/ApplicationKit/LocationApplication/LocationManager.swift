import AppState
import CoreLocation

private extension Application {
    var coreLocationManager: Dependency<CLLocationManager> {
        dependency(CLLocationManager())
    }
}

/// A class that wraps around a CLLocationManager instance from AppState's Application singleton.
open class LocationManager {
    @AppDependency(\.coreLocationManager) public var manager: CLLocationManager

    /// The delegate object to receive update events.
    public var delegate: CLLocationManagerDelegate? {
        get { manager.delegate }
        set { manager.delegate = newValue }
    }

    /// Default initializer for the LocationManager class.
    public init() { }
}

import AppState
import Foundation
import SwiftUI

#if os(iOS)
///  This is an open class that observes various lifecycle and system events.
open class LifecyleApplication: Application {
    /**
     An array of the lifecycle events this class is observing. This includes:
     - backgroundRefreshStatusDidChangeNotification
     - didBecomeActiveNotification
     - didEnterBackgroundNotification
     - didFinishLaunchingNotification
     - didReceiveMemoryWarningNotification
     - significantTimeChangeNotification
     - userDidTakeScreenshotNotification
     - willEnterForegroundNotification
     - willResignActiveNotification
     - willTerminateNotification
     */
    open var lifecycleNotifications: [LifecyleNotification] {
        [
            LifecyleNotification(
                selector: #selector(backgroundRefreshStatusDidChangeNotification(notification:)),
                name: UIApplication.backgroundRefreshStatusDidChangeNotification
            ),
            LifecyleNotification(
                selector: #selector(didBecomeActiveNotification(notification:)),
                name: UIApplication.didBecomeActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(didEnterBackgroundNotification(notification:)),
                name: UIApplication.didEnterBackgroundNotification
            ),
            LifecyleNotification(
                selector: #selector(didFinishLaunchingNotification(notification:)),
                name: UIApplication.didFinishLaunchingNotification
            ),
            LifecyleNotification(
                selector: #selector(didReceiveMemoryWarningNotification(notification:)),
                name: UIApplication.didReceiveMemoryWarningNotification
            ),
            LifecyleNotification(
                selector: #selector(significantTimeChangeNotification(notification:)),
                name: UIApplication.significantTimeChangeNotification
            ),
            LifecyleNotification(
                selector: #selector(userDidTakeScreenshotNotification(notification:)),
                name: UIApplication.userDidTakeScreenshotNotification
            ),
            LifecyleNotification(
                selector: #selector(willEnterForegroundNotification(notification:)),
                name: UIApplication.willEnterForegroundNotification
            ),
            LifecyleNotification(
                selector: #selector(willResignActiveNotification(notification:)),
                name: UIApplication.willResignActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(willTerminateNotification(notification:)),
                name: UIApplication.willTerminateNotification
            )
        ]
    }

    /// Initializes the class and registers to observe the lifecycle notifications.
    public required init() {
        super.init()

        for notification in lifecycleNotifications {
            NotificationCenter.default.addObserver(
                self,
                selector: notification.selector,
                name: notification.name,
                object: nil
            )
        }
    }

    /// Called when system's background refresh status changes
    @objc open func backgroundRefreshStatusDidChangeNotification(notification: Notification) { }
    /// Called when application becomes active
    @objc open func didBecomeActiveNotification(notification: Notification) { }
    /// Called when application enters background
    @objc open func didEnterBackgroundNotification(notification: Notification) { }
    /// Called when application finishes launching
    @objc open func didFinishLaunchingNotification(notification: Notification) { }
    /// Called when application receives a memory warning
    @objc open func didReceiveMemoryWarningNotification(notification: Notification) { }
    /// Called when system time changes significantly
    @objc open func significantTimeChangeNotification(notification: Notification) { }
    /// Called when user takes a screenshot
    @objc open func userDidTakeScreenshotNotification(notification: Notification) { }
    /// Called when application is about to enter foreground
    @objc open func willEnterForegroundNotification(notification: Notification) { }
    /// Called when application is about to become inactive
    @objc open func willResignActiveNotification(notification: Notification) { }
    /// Called when application is about to terminate
    @objc open func willTerminateNotification(notification: Notification) { }
}
#elseif os(macOS)
/// This is an open class that observes various lifecycle and system events.
open class LifecyleApplication: Application {
    /**
     An array of the lifecycle events and some system events this class is observing. This includes:
     - didBecomeActiveNotification
     - didHideNotification
     - didFinishLaunchingNotification
     - didResignActiveNotification
     - didUnhideNotification
     - didUpdateNotification
     - willBecomeActiveNotification
     - willHideNotification
     - willFinishLaunchingNotification
     - willResignActiveNotification
     - willUnhideNotification
     - willUpdateNotification
     - willTerminateNotification
     - didChangeScreenParametersNotification
     */
    open var lifecycleNotifications: [LifecyleNotification] {
        [
            LifecyleNotification(
                selector: #selector(didBecomeActiveNotification(notification:)),
                name: NSApplication.didBecomeActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(didHideNotification(notification:)),
                name: NSApplication.didHideNotification
            ),
            LifecyleNotification(
                selector: #selector(didFinishLaunchingNotification(notification:)),
                name: NSApplication.didFinishLaunchingNotification
            ),
            LifecyleNotification(
                selector: #selector(didResignActiveNotification(notification:)),
                name: NSApplication.didResignActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(didUnhideNotification(notification:)),
                name: NSApplication.didUnhideNotification
            ),
            LifecyleNotification(
                selector: #selector(didUpdateNotification(notification:)),
                name: NSApplication.didUpdateNotification
            ),
            LifecyleNotification(
                selector: #selector(willBecomeActiveNotification(notification:)),
                name: NSApplication.willBecomeActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(willHideNotification(notification:)),
                name: NSApplication.willHideNotification
            ),
            LifecyleNotification(
                selector: #selector(willFinishLaunchingNotification(notification:)),
                name: NSApplication.willFinishLaunchingNotification
            ),
            LifecyleNotification(
                selector: #selector(willResignActiveNotification(notification:)),
                name: NSApplication.willResignActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(willUnhideNotification(notification:)),
                name: NSApplication.willUnhideNotification
            ),
            LifecyleNotification(
                selector: #selector(willUpdateNotification(notification:)),
                name: NSApplication.willUpdateNotification
            ),
            LifecyleNotification(
                selector: #selector(willTerminateNotification(notification:)),
                name: NSApplication.willTerminateNotification
            ),
            LifecyleNotification(
                selector: #selector(didChangeScreenParametersNotification(notification:)),
                name: NSApplication.didChangeScreenParametersNotification
            )
        ]
    }

    /// Initializes the class and registers to observe the lifecycle and system notifications.
    public required init() {
        super.init()

        for notification in lifecycleNotifications {
            NotificationCenter.default.addObserver(
                self,
                selector: notification.selector,
                name: notification.name,
                object: nil
            )
        }
    }

    /// Called when application becomes active
    @objc open func didBecomeActiveNotification(notification: Notification) { }
    /// Called when application hides
    @objc open func didHideNotification(notification: Notification) { }
    /// Called when application finishes launching
    @objc open func didFinishLaunchingNotification(notification: Notification) { }
    /// Called when application resigns active state
    @objc open func didResignActiveNotification(notification: Notification) { }
    /// Called when application unhides
    @objc open func didUnhideNotification(notification: Notification) { }
    /// Called after application updates its windows and views
    @objc open func didUpdateNotification(notification: Notification) { }
    /// Called just before application becomes active
    @objc open func willBecomeActiveNotification(notification: Notification) { }
    /// Called just before application hides
    @objc open func willHideNotification(notification: Notification) { }
    /// Called just before application finishes launching
    @objc open func willFinishLaunchingNotification(notification: Notification) { }
    /// Called as application is about to resign its active status
    @objc open func willResignActiveNotification(notification: Notification) { }
    /// Called just as the application is about to unhide
    @objc open func willUnhideNotification(notification: Notification) { }
    /// Called just before application updates its windows and views
    @objc open func willUpdateNotification(notification: Notification) { }
    /// Called when application is about to terminate
    @objc open func willTerminateNotification(notification: Notification) { }
    /// Called when screen parameters (like resolution or color depth) change
    @objc open func didChangeScreenParametersNotification(notification: Notification) { }
}
#elseif os(watchOS)
/// This is an open class that observes various lifecycle and system events.
open class LifecyleApplication: Application {
    /**
     An array of the lifecycle events observed by this class. This includes:
     - didFinishLaunchingNotification
     - willEnterForegroundNotification
     - didBecomeActiveNotification
     - didEnterBackgroundNotification
     - willResignActiveNotification
     */
    open var lifecycleNotifications: [LifecyleNotification] {
        [
            LifecyleNotification(
                selector: #selector(didFinishLaunchingNotification(notification:)),
                name: WKApplication.didFinishLaunchingNotification
            ),
            LifecyleNotification(
                selector: #selector(willEnterForegroundNotification(notification:)),
                name: WKApplication.willEnterForegroundNotification
            ),
            LifecyleNotification(
                selector: #selector(didBecomeActiveNotification(notification:)),
                name: WKApplication.didBecomeActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(didEnterBackgroundNotification(notification:)),
                name: WKApplication.didEnterBackgroundNotification
            ),
            LifecyleNotification(
                selector: #selector(willResignActiveNotification(notification:)),
                name: WKApplication.willResignActiveNotification
            )
        ]
    }

    /// Initializes the class and registers to observe the lifecycle notifications.
    public required init() {
        super.init()

        for notification in lifecycleNotifications {
            NotificationCenter.default.addObserver(
                self,
                selector: notification.selector,
                name: notification.name,
                object: nil
            )
        }
    }

    /// Called when application finishes launching
    @objc open func didFinishLaunchingNotification(notification: Notification) { }
    /// Called when application will enter the foreground
    @objc open func willEnterForegroundNotification(notification: Notification) { }
    /// Called when application becomes active
    @objc open func didBecomeActiveNotification(notification: Notification) { }
    /// Called when application enters the background
    @objc open func didEnterBackgroundNotification(notification: Notification) { }
    /// Called when application is about to become inactive
    @objc open func willResignActiveNotification(notification: Notification) { }
}
#elseif os(tvOS)
/// This is an open class that observes various lifecycle and system events.
open class LifecyleApplication: Application {
    /**
     An array of the lifecycle events observed by this class. This includes:
     - didFinishLaunchingNotification
     - willEnterForegroundNotification
     - didBecomeActiveNotification
     - didEnterBackgroundNotification
     - willResignActiveNotification
     */
    open var lifecycleNotifications: [LifecyleNotification] {
        [
            LifecyleNotification(
                selector: #selector(didFinishLaunchingNotification(notification:)),
                name: UIApplication.didFinishLaunchingNotification
            ),
            LifecyleNotification(
                selector: #selector(willEnterForegroundNotification(notification:)),
                name: UIApplication.willEnterForegroundNotification
            ),
            LifecyleNotification(
                selector: #selector(didBecomeActiveNotification(notification:)),
                name: UIApplication.didBecomeActiveNotification
            ),
            LifecyleNotification(
                selector: #selector(didEnterBackgroundNotification(notification:)),
                name: UIApplication.didEnterBackgroundNotification
            ),
            LifecyleNotification(
                selector: #selector(willResignActiveNotification(notification:)),
                name: UIApplication.willResignActiveNotification
            )
        ]
    }

    /// Initializes the class and registers to observe the lifecycle notifications.
    public required init() {
        super.init()

        for notification in lifecycleNotifications {
            NotificationCenter.default.addObserver(
                self,
                selector: notification.selector,
                name: notification.name,
                object: nil
            )
        }
    }

    /// Called when application finishes launching
    @objc open func didFinishLaunchingNotification(notification: Notification) { }
    /// Called when application will enter the foreground
    @objc open func willEnterForegroundNotification(notification: Notification) { }
    /// Called when application becomes active
    @objc open func didBecomeActiveNotification(notification: Notification) { }
    /// Called when application enters the background
    @objc open func didEnterBackgroundNotification(notification: Notification) { }
    /// Called when application is about to become inactive
    @objc open func willResignActiveNotification(notification: Notification) { }
}
#endif

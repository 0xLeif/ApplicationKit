# ApplicationKit

ApplicationKit is a Swift-based library that provides a rich set of tools for managing and working with application state. Building upon [AppState](https://github.com/0xLeif/AppState), it provides an additional layer of functionality to manage lifecycle notifications and state changes in applications.

## Features

- A Lifecycle Management API that provides callback functions for significant events in the application lifecycle.
- A simplified interface to run closures only once from anywhere within the codebase.
- A streamlined approach to handling and observing different lifecycle notifications.
- Debugging support with file location attributes for effective lifecycle event tracking.
- More to come...

## Getting Started

### Requirements

- Swift 5.7 or later

- iOS 15.0 or later
- watchOS 8.0 or later
- macOS 11.0 or later
- tvOS 15.0 or later

### Installation

You can integrate ApplicationKit into your project using Swift Package Manager.

Once you have your Swift package set up, adding ApplicationKit as a dependency is as easy as adding it to the dependencies value of your Package.swift file.

```swift
dependencies: [
    .package(url: "https://github.com/0xLeif/ApplicationKit.git", from: "0.1.0")
]
```

## Usage

To handle various application states, override the necessary methods in your custom application class:

```swift
private class MyApplication: LifecyleApplication {

    override var lifecycleNotifications: [LifecyleNotification] {
        super.lifecycleNotifications + [
            // Your additional lifecycle notifications
        ]
    }

    /// Gets called when application state becomes active
    override func didBecomeActiveNotification(notification: Notification) { 
        // Custom code implementation 
    }
}
```

In your App initialization, promote your custom application class:

```swift
Application.promote(to: MyApplication.self)
```

Use ApplicationKit's `.runOnce` feature to run a specific closure code once within the lifecycle of the application:
```swift
Application.runOnce { performExpensiveTaskHere() }
```

## Contributing

Pull requests are very welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

ApplicationKit is distributed under the MIT license. For more information, refer to the LICENSE file.

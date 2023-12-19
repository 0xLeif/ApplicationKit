import Foundation

extension LifecyleApplication {
    /**
     Represents a Lifecycle Notification event in the scope of `LifecyleApplication`.

     This structure holds two properties:
     - Selector: An action to be performed when the notification is observed.
     - Notification.Name: The name of the notification event to be observed.
     */
    public struct LifecyleNotification {
        /// The action to be performed when the notification is observed.
        public let selector: Selector

        /// The name of the notification event to be observed.
        public let name: Notification.Name

        /**
         Creates a `LifecyleNotification` with specified selector and notification name.

         - Parameters:
           - selector: The selector to be called when the notification is posted.
           - name: The unique name of the notification to observe.
         */
        public init(selector: Selector, name: Notification.Name) {
            self.selector = selector
            self.name = name
        }
    }
}

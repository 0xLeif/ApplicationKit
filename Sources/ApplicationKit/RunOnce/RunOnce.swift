import AppState
import Foundation

private class RunOnceManager {
    private var lock: NSLock
    private var ran: [String]

    init() {
        self.lock = NSLock()
        self.ran = []
    }

    func add(_ id: String) {
        lock.lock()
        ran.append(id)
        lock.unlock()
    }

    func contains(id: String) -> Bool {
        lock.lock(); defer { lock.unlock() }

        return ran.contains(id)
    }
}

extension Application {
    private var runOnceManager: Dependency<RunOnceManager> {
        dependency(RunOnceManager())
    }

    /**
     Ensures the specified closure only runs once within the lifecycle of the application.

     This function creates a unique identifier based on the passed in file identifier, function name, line number, and column number, where it's called. If the function has been called before with the same parameters, it will not execute the closure. Otherwise, it will add the unique identifier to the `runOnceManager` and execute the closure.

     Usage example:
     ```swift
     Application.runOnce {
        performExpensiveTask()
     }
     ```

     - Parameters:
       - closure: The closure to be executed only once.
     */
    public static func runOnce(
        _ fileID: StaticString = #fileID,
        _ function: StaticString = #function,
        _ line: Int = #line,
        _ column: Int = #column,
        closure: () -> Void
    ) {
        let codeID = "\(fileID).\(function)@\(line)-\(column)"
        let runOnceManager = dependency(\.runOnceManager)

        guard runOnceManager.contains(id: codeID) == false else { return }

        runOnceManager.add(codeID)

        closure()
    }
}

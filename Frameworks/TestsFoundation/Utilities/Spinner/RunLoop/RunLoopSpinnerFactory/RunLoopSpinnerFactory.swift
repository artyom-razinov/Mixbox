public protocol RunLoopSpinnerFactory {
    func spinnerImpl(
        timeout: TimeInterval,
        minRunLoopDrains: Int,
        maxSleepInterval: TimeInterval,
        conditionMetHandler: @escaping () -> ())
        -> RunLoopSpinner
}

extension RunLoopSpinnerFactory {
    public func spinner(
        timeout: TimeInterval,
        // The default value is 2 because, as per the CFRunLoop implementation, some ports
        // (specifically the dispatch port) will only be serviced every other run loop drain.
        minRunLoopDrains: Int = 2,
        maxSleepInterval: TimeInterval = .greatestFiniteMagnitude,
        conditionMetHandler: @escaping () -> () = {})
        -> RunLoopSpinner
    {
        return spinnerImpl(
            timeout: timeout,
            minRunLoopDrains: minRunLoopDrains,
            maxSleepInterval: maxSleepInterval,
            conditionMetHandler: conditionMetHandler
        )
    }
}

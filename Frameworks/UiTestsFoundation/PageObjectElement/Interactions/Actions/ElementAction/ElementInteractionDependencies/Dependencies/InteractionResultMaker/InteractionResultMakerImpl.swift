import MixboxArtifacts
import MixboxTestsFoundation
import MixboxFoundation

public final class InteractionResultMakerImpl: InteractionResultMaker {
    private let elementHierarchyDescriptionProvider: ElementHierarchyDescriptionProvider
    private let screenshotTaker: ScreenshotTaker
    private let extendedStackTraceProvider: ExtendedStackTraceProvider
    private let fileLine: FileLine
    
    public init(
        elementHierarchyDescriptionProvider: ElementHierarchyDescriptionProvider,
        screenshotTaker: ScreenshotTaker,
        extendedStackTraceProvider: ExtendedStackTraceProvider,
        fileLine: FileLine)
    {
        self.elementHierarchyDescriptionProvider = elementHierarchyDescriptionProvider
        self.screenshotTaker = screenshotTaker
        self.extendedStackTraceProvider = extendedStackTraceProvider
        self.fileLine = fileLine
    }
    
    public func decorateFailure(
        interactionFailure: InteractionFailure)
        -> InteractionResult
    {
        let failure = InteractionFailure(
            message: interactionFailure.message,
            attachments: interactionFailure.attachments + attachments(message: interactionFailure.message),
            nestedFailures: interactionFailure.nestedFailures
        )
        
        return .failure(failure)
    }
    
    private func attachments(message: String) -> [Artifact] {
        var artifacts = [Artifact]()
        
        artifacts.append(contentsOf: hierarchyArtifacts())
        artifacts.append(contentsOf: stackTraceArtifacts())
        artifacts.append(contentsOf: errorMessageArtifacts(message: message))
        
        return artifacts
    }
    
    private func stackTraceArtifacts() -> [Artifact] {
        // TODO: Share code! Exctract to class.
        // Should look like: "2   xctest                              0x000000010e7a0069 main + 0"
        
        let string = extendedStackTraceProvider
            .extendedStackTrace()
            .enumerated()
            .map { indexed in
                if let file = indexed.element.file, let line = indexed.element.line {
                    return "\(indexed.offset) \(file):\(line)"
                } else {
                    return "\(indexed.offset) \(indexed.element.symbol ?? "???") \(indexed.element.address)"
                }
            }
            .joined(separator: "\n")
        
        return [
            Artifact(
                name: "Stack trace",
                content: .text(string)
            )
        ]
    }
    
    private func hierarchyArtifacts() -> [Artifact] {
        guard let string = elementHierarchyDescriptionProvider.elementHierarchyDescription() else {
            return []
        }
        
        return [
            Artifact(
                name: "Element hierarchy",
                content: .text(string)
            )
        ]
    }
    
    private func errorMessageArtifacts(message: String) -> [Artifact] {
        return [
            Artifact(
                name: "Error description",
                content: .text("\(fileLine.file):\(fileLine.line): \(message))")
            )
        ]
    }
    
}

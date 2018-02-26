import Foundation

internal extension Presenter {
    internal func present(presentation:PresentationProtocol) {
        self.addController(presentation:presentation)
        presentation.presentationStrategy(self)(presentation)
    }
}

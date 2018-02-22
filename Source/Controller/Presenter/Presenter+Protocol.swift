import Foundation

internal extension Presenter
{
    //MARK: internal
    
    internal func present(presentation:PresentationProtocol)
    {
        self.addController(presentation:presentation)
        presentation.presentationStrategy(self)(presentation)
    }
}

import Foundation

internal extension Presenter
{
    //MARK: internal
    
    internal func present(presentation:PresentationProtocol)
    {
        let controllerType:ControllerProtocol.Type = presentation.model.controllerType
        self.addController(controllerType:controllerType)
        self.presentView(presentation:presentation)
    }
}

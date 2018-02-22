import UIKit

internal extension Presenter
{
    //MARK: internal
    
    internal func present(presentation:PresentationProtocol)
    {
        var presentation:PresentationProtocol = presentation
        
        guard
            
            let controller:UIViewController = Presenter.factoryController(presentation:presentation)
        
        else
        {
            return
        }
        
        self.addController(controller:controller)
        presentation.view = controller.view
        
        presentation.presentation(self)(presentation)
    }
}

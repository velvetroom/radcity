import UIKit

internal extension Presenter
{
    //MARK: internal
    
    internal func present(presentation:PresentationProtocol)
    {
        guard
            
            let controller:UIViewController = Presenter.factoryController(presentation:presentation)
        
        else
        {
            return
        }
        
        self.addController(controller:controller)
    }
}

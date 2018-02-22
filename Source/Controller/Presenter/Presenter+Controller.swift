import UIKit

internal extension Presenter
{
    //MARK: internal
    
    internal func addController(presentation:PresentationProtocol)
    {
        guard
            
            let controller:UIViewController = presentation.controller
        
        else
        {
            return
        }
        
        self.addChildViewController(controller)
    }
}

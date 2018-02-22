import UIKit

internal extension Presenter
{
    //MARK: internal
    
    internal func addController(controllerType:ControllerProtocol.Type)
    {
        guard
        
            let controller:UIViewController = controllerType.viewController
        
        else
        {
            return
        }
        
        self.addChildViewController(controller)
    }
}

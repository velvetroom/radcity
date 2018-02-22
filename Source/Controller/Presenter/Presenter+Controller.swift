import UIKit

internal extension Presenter
{
    //MARK: internal
    
    internal class func factoryController(presentation:PresentationProtocol) -> UIViewController?
    {
        let controllerType:ControllerProtocol.Type = presentation.model.controllerType
        
        guard
            
            let controller:UIViewController = controllerType.viewController
            
        else
        {
            return nil
        }
        
        return controller
    }
    
    internal func addController(controller:UIViewController)
    {
        self.addChildViewController(controller)
    }
}

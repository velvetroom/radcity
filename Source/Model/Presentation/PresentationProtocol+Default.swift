import UIKit

internal extension PresentationProtocol
{
    internal weak var view:UIView?
    {
        get
        {
            return self.controller?.view
        }
    }
    
    //MARK: internal

    mutating internal func factoryUI()
    {
        let controllerType:ControllerProtocol.Type = self.model.controllerType
        
        guard
            
            let controller:UIViewController = controllerType.viewController
            
        else
        {
            return
        }
        
        self.controller = controller
    }
}

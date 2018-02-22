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
    
    init(model:ModelProtocol)
    {
        self.init(model:model)
        self.factoryUI()
    }
    
    //MARK: private
    
    mutating private func factoryUI()
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

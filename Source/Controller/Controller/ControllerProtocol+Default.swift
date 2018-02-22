import UIKit

internal extension ControllerProtocol
{
    //MARK: internal
    
    static var viewController:UIViewController?
    {
        get
        {
            guard
            
                let type:UIViewController.Type = self as? UIViewController.Type
            
            else
            {
                return nil
            }
            
            let viewController:UIViewController = type.init()
            
            return viewController
        }
    }
}

import UIKit

internal extension ControllerProtocol {
    internal static var viewController:UIViewController? {
        get {
            let type:UIViewController.Type? = self as? UIViewController.Type
            let viewController:UIViewController? = type?.init()
            
            return viewController
        }
    }
}

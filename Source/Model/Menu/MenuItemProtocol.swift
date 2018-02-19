import UIKit

protocol MenuItemProtocol
{
    var order:Menu.Order { get }
    var icon:UIImage { get }
    var controllerType:UIViewController.Type { get }
    
    init()
}

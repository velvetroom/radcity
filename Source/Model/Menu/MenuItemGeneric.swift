import UIKit

protocol MenuItemGeneric
{
    var order:Menu.Order { get }
    var icon:UIImage { get }
    var controllerType:UIViewController.Type { get }
}

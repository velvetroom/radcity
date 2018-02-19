import UIKit

protocol ViewControllableProtocol:class
{
    associatedtype C:UIViewController
    
    weak var controller:C! { get }
    
    init(controller:C)
}

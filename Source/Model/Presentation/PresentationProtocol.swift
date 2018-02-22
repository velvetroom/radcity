import UIKit

internal protocol PresentationProtocol
{
    weak var controller:UIViewController? { get set }
    weak var view:UIView? { get }
    var model:ModelProtocol { get }
    var presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) { get }
    
    init(model:ModelProtocol)
}

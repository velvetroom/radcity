import UIKit

internal protocol PresentationProtocol {
    weak var view:UIView? { get }
    var controller:UIViewController? { get set }
    var model:ModelProtocol { get }
    var presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) { get }
    
    init(model:ModelProtocol)
}

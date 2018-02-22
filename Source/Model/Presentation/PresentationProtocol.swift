import UIKit

internal protocol PresentationProtocol
{
    weak var view:UIView? { get set }
    var model:ModelProtocol { get }
    var presentation:((Presenter) -> (PresentationProtocol) -> ()) { get }
}

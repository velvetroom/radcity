import UIKit

internal protocol PresentationProtocol
{
    var model:ModelProtocol { get }
    var presentation:((Presenter) -> (UIView, PresentationProtocol) -> ()) { get }
}

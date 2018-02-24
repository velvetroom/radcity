import UIKit

internal protocol ViewProtocol {
    var presentationLayout:PresentationLayout { get set }
    static var view:UIView? { get }
}

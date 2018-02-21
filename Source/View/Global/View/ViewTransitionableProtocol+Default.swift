import UIKit

extension ViewTransitionableProtocol
{
    var view:UIView?
    {
        get
        {
            return self as? UIView
        }
    }
}

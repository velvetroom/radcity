import UIKit

internal extension ViewProtocol {
    internal static var view:UIView? {
        get {
            let type:UIView.Type? = self as? UIView.Type
            let view:UIView? = type?.init()
            
            return view
        }
    }
}

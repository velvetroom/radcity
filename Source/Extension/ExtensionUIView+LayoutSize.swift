import UIKit

public extension UIView {
    public func layoutSize(constant:CGFloat) {
        self.layoutWidth(constant:constant)
        self.layoutHeight(constant:constant)
    }
}

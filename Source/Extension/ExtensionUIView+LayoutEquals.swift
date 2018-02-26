import UIKit

public extension UIView {
    public func layoutEquals(view:UIView, margin:CGFloat = 0) {
        self.layoutEqualsVertical(view:view, margin:margin)
        self.layoutEqualsHorizontal(view:view, margin:margin)
    }
    
    public func layoutEqualsHorizontal(view:UIView, margin:CGFloat = 0) {
        self.layoutLeftToLeft(view:view, constant:margin)
        self.layoutRightToRight(view:view, constant:-margin)
    }
    
    public func layoutEqualsVertical(view:UIView, margin:CGFloat = 0) {
        self.layoutTopToTop(view:view, constant:margin)
        self.layoutBottomToBottom(view:view, constant:-margin)
    }
}

import UIKit

extension UIView
{
    //MARK: internal
    
    func layoutEquals(
        toView:UIView,
        margin:CGFloat = 0)
    {
        NSLayoutConstraint.topToTop(
            view:view,
            toView:toView,
            constant:margin)
        NSLayoutConstraint.bottomToBottom(
            view:view,
            toView:toView,
            constant:-margin)
        NSLayoutConstraint.leftToLeft(
            view:view,
            toView:toView,
            constant:margin)
        NSLayoutConstraint.rightToRight(
            view:view,
            toView:toView,
            constant:-margin)
    }
    
    func layoutEqualsHorizontal(
        toView:UIView,
        margin:CGFloat = 0)
    {
        NSLayoutConstraint.leftToLeft(
            view:view,
            toView:toView,
            constant:margin)
        NSLayoutConstraint.rightToRight(
            view:view,
            toView:toView,
            constant:-margin)
    }
    func layoutEqualsVertical(
        toView:UIView,
        margin:CGFloat = 0)
    {
        NSLayoutConstraint.topToTop(
            view:view,
            toView:toView,
            constant:margin)
        NSLayoutConstraint.bottomToBottom(
            view:view,
            toView:toView,
            constant:-margin)
    }
}

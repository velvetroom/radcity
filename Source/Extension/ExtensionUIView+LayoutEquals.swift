import UIKit

public extension UIView
{
    //MARK: public
    
    public func layoutEquals(
        view:UIView,
        margin:CGFloat = 0)
    {
        self.layoutTopToTop(
            view:view,
            constant:margin)
        self.layoutBottomToBottom(
            view:view,
            constant:-margin)
        self.layoutLeftToLeft(
            view:view,
            constant:margin)
        self.layoutRightToRight(
            view:view,
            constant:-margin)
    }
    
    public func layoutEqualsHorizontal(
        view:UIView,
        margin:CGFloat = 0)
    {
        self.layoutLeftToLeft(
            view:view,
            constant:margin)
        
        self.layoutRightToRight(
            view:view,
            constant:-margin)
    }
    
    public func layoutEqualsVertical(
        view:UIView,
        margin:CGFloat = 0)
    {
        self.layoutTopToTop(
            view:view,
            constant:margin)
        
        self.layoutBottomToBottom(
            view:view,
            constant:-margin)
    }
}

import UIKit

extension UIView
{
    //MARK: internal
    
    func layoutEquals(
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
    
    func layoutEqualsHorizontal(
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
    
    func layoutEqualsVertical(
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

import UIKit

public extension UIView
{
    //MARK: public
    
    @discardableResult public func layoutTopToTop(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.top,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func layoutTopToBottom(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.top,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.bottom,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func layoutBottomToBottom(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.bottom,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func layoutBottomToTop(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.bottom,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.top,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
}

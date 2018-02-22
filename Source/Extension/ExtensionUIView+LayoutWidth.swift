import UIKit

public extension UIView
{
    //MARK: internal
    
    @discardableResult public func layoutWidth(
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func layoutWidthGreaterOrEqual(
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.greaterThanOrEqual,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult public func layoutWidth(
        view:UIView,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.width,
            multiplier:multiplier,
            constant:0)
        
        constraint.isActive = true
        
        return constraint
    }
}

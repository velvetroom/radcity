import UIKit

extension NSLayoutConstraint
{
    @discardableResult class func width(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:view,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult class func widthGreaterOrEqual(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:view,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.greaterThanOrEqual,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult class func height(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:view,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.equal,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult class func heightGreaterOrEqual(
        view:UIView,
        constant:CGFloat = 0,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:view,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.greaterThanOrEqual,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:multiplier,
            constant:constant)
        
        constraint.isActive = true
        
        return constraint
    }
    
    class func size(
        view:UIView,
        constant:CGFloat,
        multiplier:CGFloat = 1)
    {
        NSLayoutConstraint.width(
            view:view,
            constant:constant,
            multiplier:multiplier)
        
        NSLayoutConstraint.height(
            view:view,
            constant:constant,
            multiplier:multiplier)
    }
    
    @discardableResult class func width(
        view:UIView,
        toView:UIView,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:view,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:toView,
            attribute:NSLayoutAttribute.width,
            multiplier:multiplier,
            constant:0)
        
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult class func height(
        view:UIView,
        toView:UIView,
        multiplier:CGFloat = 1) -> NSLayoutConstraint
    {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:view,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.equal,
            toItem:toView,
            attribute:NSLayoutAttribute.height,
            multiplier:multiplier,
            constant:0)
        
        constraint.isActive = true
        
        return constraint
    }
}

import UIKit

public extension UIView {
    @discardableResult
    public func layoutWidth(constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    public func layoutWidthGreaterOrEqual(constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.greaterThanOrEqual,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    public func layoutWidth(view:UIView) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.width,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.width,
            multiplier:1,
            constant:0)
        constraint.isActive = true
        
        return constraint
    }
}

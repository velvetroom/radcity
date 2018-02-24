import UIKit

public extension UIView {
    @discardableResult
    public func layoutHeight(constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.equal,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    public func layoutHeightGreaterOrEqual(constant:CGFloat = 0) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.greaterThanOrEqual,
            toItem:nil,
            attribute:NSLayoutAttribute.notAnAttribute,
            multiplier:1,
            constant:constant)
        constraint.isActive = true
        
        return constraint
    }
    
    @discardableResult
    public func layoutHeight(view:UIView, multiplier:CGFloat = 1) -> NSLayoutConstraint {
        let constraint:NSLayoutConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.height,
            relatedBy:NSLayoutRelation.equal,
            toItem:view,
            attribute:NSLayoutAttribute.height,
            multiplier:multiplier,
            constant:0)
        constraint.isActive = true
        
        return constraint
    }
}

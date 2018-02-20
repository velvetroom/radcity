import UIKit

extension NSLayoutConstraint
{
    
    
    
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
    
    
}

import UIKit

extension UIView
{
    //MARK: internal
    
    func layoutSize(
        constant:CGFloat,
        multiplier:CGFloat = 1)
    {
        NSLayoutConstraint.width(
            view:self,
            constant:constant,
            multiplier:multiplier)
        
        NSLayoutConstraint.height(
            view:self,
            constant:constant,
            multiplier:multiplier)
    }
}

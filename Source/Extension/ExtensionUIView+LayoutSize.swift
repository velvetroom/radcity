import UIKit

public extension UIView
{
    //MARK: public
    
    public func layoutSize(
        constant:CGFloat,
        multiplier:CGFloat = 1)
    {
        self.layoutWidth(
            constant:constant,
            multiplier:multiplier)
        
        self.layoutHeight(
            constant:constant,
            multiplier:multiplier)
    }
}

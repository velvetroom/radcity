import UIKit

extension UIView
{
    //MARK: internal
    
    func layoutSize(
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

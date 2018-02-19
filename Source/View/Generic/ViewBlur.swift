import UIKit

final class ViewBlur:UIVisualEffectView
{
    class func light() -> ViewBlur
    {
        let style:UIBlurEffectStyle = UIBlurEffectStyle.light
        let blur:ViewBlur = ViewBlur(style:style)
        
        return blur
    }
    
    class func extraLight() -> ViewBlur
    {
        let style:UIBlurEffectStyle = UIBlurEffectStyle.extraLight
        let blur:ViewBlur = ViewBlur(style:style)
        
        return blur
    }
    
    class func dark() -> ViewBlur
    {
        let style:UIBlurEffectStyle = UIBlurEffectStyle.dark
        let blur:ViewBlur = ViewBlur(style:style)
        
        return blur
    }
    
    private init(style:UIBlurEffectStyle)
    {
        let visualEffect:UIBlurEffect = UIBlurEffect(style:style)
        
        super.init(effect:visualEffect)
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

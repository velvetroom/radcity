import UIKit

final class ViewParent:UIView
{
    weak var panRecognizer:UIPanGestureRecognizer!
    private(set) weak var controller:ControllerParent!
    private(set) weak var viewMenu:ViewMenu!
    var panningX:CGFloat?
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.controller = controller
        
        let viewMenu:ViewMenu = ViewMenu(controller:controller)
        self.viewMenu = viewMenu
        
        self.addSubview(viewMenu)
        
        NSLayoutConstraint.bottomToBottom(
            view:viewMenu,
            toView:self)
        NSLayoutConstraint.height(
            view:viewMenu,
            constant:ViewGlobal.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewMenu,
            toView:self)
        
        self.factoryGesture()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}

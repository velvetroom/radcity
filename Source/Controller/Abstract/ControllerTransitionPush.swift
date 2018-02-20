import UIKit

struct ControllerTransitionPush
{
    var completion:(() -> ())?
    var left:CGFloat
    var top:CGFloat
    var background:Bool
    let controller:UIViewController
    let newView:ViewTransitionableProtocol
    
    init(
        controller:UIViewController,
        newView:ViewTransitionableProtocol)
    {
        self.controller = controller
        self.newView = newView
        self.top = 0
        self.left = 0
        self.background = false
    }
}

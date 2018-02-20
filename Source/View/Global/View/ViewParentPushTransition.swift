import UIKit

struct ViewParentPushTransition
{
    var left:CGFloat
    var top:CGFloat
    var background:Bool
    var completion:(() -> ())?
    let newView:ViewTransitionableProtocol
    
    init(newView:ViewTransitionableProtocol)
    {
        self.newView = newView
        self.left = 0
        self.top = 0
        self.background = false
    }
}

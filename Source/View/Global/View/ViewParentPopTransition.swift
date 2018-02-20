import UIKit

struct ViewParentPopTransition
{
    var completion:(() -> ())?
    var left:CGFloat
    var top:CGFloat
    let currentView:ViewTransitionableProtocol
    
    init(currentView:ViewTransitionableProtocol)
    {
        self.currentView = currentView
        self.left = 0
        self.top = 0
    }
}

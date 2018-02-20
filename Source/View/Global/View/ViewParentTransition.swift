import UIKit

struct ViewParentTransition
{
    var left:CGFloat
    var completion:(() -> ())
    let currentView:ViewTransitionableProtocol
    let newView:ViewTransitionableProtocol
    
    init(
        currentView:ViewTransitionableProtocol,
        newView:ViewTransitionableProtocol)
    {
        self.currentView = currentView
        self.newView = newView
        self.left = 0
    }
}

import UIKit

struct ViewParentTransition
{
    var left:CGFloat
    var completion:(() -> ())?
    let currentView:ViewTransitionableProtocol
    let newView:ViewTransitionableProtocol
    let currentUi:UIView
    
    init(
        currentView:ViewTransitionableProtocol,
        newView:ViewTransitionableProtocol,
        currentUi:UIView)
    {
        self.currentView = currentView
        self.newView = newView
        self.currentUi = currentUi
        self.left = 0
    }
}

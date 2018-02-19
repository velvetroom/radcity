import UIKit

class ViewMain<A>:View<A>, ViewTransitionableProtocol where A.C:Controller<A>
{
    var shouldPanBack:Bool = false
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:ViewPushBackground?
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.white
    }
}

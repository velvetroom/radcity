import UIKit

struct ControllerTransitionPush<A> where A:Arch, A.V:View<A>
{
    var completion:(() -> ())?
    var left:CGFloat
    var top:CGFloat
    var background:Bool
    let controller:Controller<A>
    
    init(controller:Controller<A>)
    {
        self.controller = controller
        self.top = 0
        self.left = 0
        self.background = false
    }
}

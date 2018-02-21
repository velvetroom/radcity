import UIKit

struct ControllerTransitionPush<A> where A:Arch, A.V:View<A>
{
    var completion:(() -> ())?
    var background:Bool
    private(set) var horizontal:CGFloat
    private(set) var vertical:CGFloat
    let controller:Controller<A>
    
    init(controller:Controller<A>)
    {
        self.controller = controller
        self.vertical = 0
        self.horizontal = 0
        self.background = true
    }
    
    //MARK: internal
    
    mutating func addTransition(transition:ControllerTransition)
    {
        self.horizontal = transition.horizontal
        self.vertical = transition.vertical
    }
}

import UIKit

extension ControllerTransitionPush
{
    //MARK: internal
    
    static func factoryPushFromRight<A>(
        controller:Controller<A>) -> ControllerTransitionPush<A> where A.C:Controller<A>
    {
        var push:ControllerTransitionPush<A> = ControllerTransitionPush<A>(controller:controller)
        let transition:ControllerTransition = ControllerTransition.right
        
        push.addTransition(transition:transition)
        
        return push
    }
}

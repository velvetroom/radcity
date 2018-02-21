import UIKit

extension ControllerTransitionPush
{
    //MARK: internal
    
    static func factoryPushFromRight<A>(
        controller:Controller<A>) -> ControllerTransitionPush<A> where A.C:Controller<A>
    {
        let transition:ControllerTransitionPush<A> = ControllerTransitionPush<A>(controller:controller)
        
        return transition
    }
}

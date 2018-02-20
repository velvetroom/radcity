import UIKit

extension ControllerTransition
{
    static var top:ControllerTransition
    {
        get
        {
            let transition:ControllerTransition = ControllerTransition(vertical:-1, horizontal:0)
            
            return transition
        }
    }
    
    static var bottom:ControllerTransition
    {
        get
        {
            let transition:ControllerTransition = ControllerTransition(vertical:1, horizontal:0)
            
            return transition
        }
    }
    
    static var left:ControllerTransition
    {
        get
        {
            let transition:ControllerTransition = ControllerTransition(vertical:0, horizontal:-1)
            
            return transition
        }
    }
    
    static var right:ControllerTransition
    {
        get
        {
            let transition:ControllerTransition = ControllerTransition(vertical:0, horizontal:1)
            
            return transition
        }
    }
}

import UIKit

internal extension ViewProtocol
{
    //MARK: internal
    
    internal static var view:UIView?
    {
        get
        {
            guard
                
                let type:UIView.Type = self as? UIView.Type
                
            else
            {
                return nil
            }
            
            let view:UIView = type.init()
            
            return view
        }
    }
}

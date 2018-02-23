import UIKit

internal extension Application
{
    //MARK: internal
    
    internal func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        self.startPresentation()
        
        return true
    }
}

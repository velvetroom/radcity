import UIKit

internal extension Application {
    internal func application(
        _:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        self.startPresentation()
        
        return true
    }
}

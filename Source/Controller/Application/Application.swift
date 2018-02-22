import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate
{
    internal var window:UIWindow?
    internal let initialArchitecture:ArchitectureHome.Type
    
    internal override init()
    {
        self.initialArchitecture = ArchitectureHome.self
        
        super.init()
    }
}

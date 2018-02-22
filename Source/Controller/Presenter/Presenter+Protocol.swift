import Foundation

internal extension Presenter
{
    //MARK: internal
    
    internal func presentCentered<PresentingArchitecture>(controller:Controller<PresentingArchitecture>)
    {
        self.addChildViewController(controller)
    }
}

import Foundation

extension Presenter
{
    //MARK: internal
    
    func presentCentered<PresentingArchitecture>(controller:Controller<PresentingArchitecture>)
    {
        self.addChildViewController(controller)
    }
}

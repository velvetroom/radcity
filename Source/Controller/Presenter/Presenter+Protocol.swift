import Foundation

extension Presenter
{
    func presentCentered<PresentingArchitecture>(controller:Controller<PresentingArchitecture>)
    {
        self.addChildViewController(controller)
    }
}

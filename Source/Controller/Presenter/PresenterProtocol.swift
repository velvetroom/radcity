import Foundation

internal protocol PresenterProtocol
{
    func presentCentered<PresentingArchitecture>(controller:Controller<PresentingArchitecture>)
}

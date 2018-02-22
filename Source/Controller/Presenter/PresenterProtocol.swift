import Foundation

protocol PresenterProtocol
{
    func presentCentered<PresentingArchitecture>(controller:Controller<PresentingArchitecture>)
}

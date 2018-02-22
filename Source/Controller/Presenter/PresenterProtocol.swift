import Foundation

protocol PresenterProtocol
{
    func presentCentered<PresentingArchitecture>(architecture:PresentingArchitecture.Type)
}
